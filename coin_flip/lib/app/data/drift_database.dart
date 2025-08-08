import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

part 'drift_database.g.dart';

// --- Tablo Tanımları ---

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().unique()();
  TextColumn get email => text().unique()();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastName => text().named('last_name')();
  TextColumn get passwordHash => text().named('password_hash')();
  BoolColumn get isVerified =>
      boolean().named('is_verified').withDefault(const Constant(false))();
}

@DataClassName('KullaniciRow')
class Kullanici extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
}

@DataClassName('GameHistoryEntry')
class GameHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get result => text()();
  DateTimeColumn get playedAt => dateTime()();
}

@DataClassName('UserStat')
class UserStats extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get totalFlips => integer().withDefault(const Constant(0))();
  IntColumn get headsCount => integer().withDefault(const Constant(0))();
  IntColumn get tailsCount => integer().withDefault(const Constant(0))();
  IntColumn get bestStreak => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime()();
}

// --- Veritabanı Sınıfı ---

@DriftDatabase(
  tables: [Users, Kullanici, GameHistory, UserStats],
  daos: [UsersDao, KullaniciDao, GameHistoryDao, UserStatsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Versiyon 1'den 2'ye geçerken eksik olan 'users' tablosunu oluştur.
          await m.createTable(users);
        }
        if (from < 3) {
          // Versiyon 2'den 3'e geçişte 'kullanici' tablosunu oluştur.
          await m.createTable(kullanici);
        }
        if (from < 4) {
          // Versiyon 3'ten 4'e: users tablosuna is_verified sütunu ekle (idempotent)
          await customStatement(
            "ALTER TABLE public.users ADD COLUMN IF NOT EXISTS is_verified boolean NOT NULL DEFAULT false",
          );
        }
      },
    );
  }
}

// --- Veritabanı Bağlantısı ---

QueryExecutor _openConnection() {
  // UYARI: Hassas bilgileri doğrudan koda gömmek ciddi bir güvenlik açığıdır.
  // Bu bilgiler bir yapılandırma dosyasından veya ortam değişkenlerinden okunmalıdır.
  final endpoint = pg.Endpoint(
    host: '49.12.188.137',
    port: 5432,
    database: 'melis_db',
    username: 'melis_db_user',
    password: 'xh2Ba1NhT2I9joJ4',
  );

  return PgDatabase(endpoint: endpoint);
}

// --- DAO (Veri Erişim Nesnesi) Tanımları ---

@DriftAccessor(tables: [Users])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  final AppDatabase db;
  UsersDao(this.db) : super(db);

  Future<int> createUser({
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String passwordHash,
  }) async {
    return into(users).insert(UsersCompanion.insert(
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      passwordHash: passwordHash,
      isVerified: const Value(false),
    ));
  }

  Future<User?> findByUsernameOrEmail(String identifier) async {
    return (select(users)
          ..where((u) =>
              u.username.equals(identifier) | u.email.equals(identifier)))
        .getSingleOrNull();
  }
}

@DriftAccessor(tables: [Kullanici])
class KullaniciDao extends DatabaseAccessor<AppDatabase>
    with _$KullaniciDaoMixin {
  final AppDatabase db;
  KullaniciDao(this.db) : super(db);
}

@DriftAccessor(tables: [GameHistory])
class GameHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$GameHistoryDaoMixin {
  final AppDatabase db;
  GameHistoryDao(this.db) : super(db);

  Future<List<GameHistoryEntry>> getAllHistoryEntries() =>
      select(gameHistory).get();
  Stream<List<GameHistoryEntry>> watchAllHistoryEntries() =>
      select(gameHistory).watch();
  Future<int> addHistoryEntry(GameHistoryCompanion entry) =>
      into(gameHistory).insert(entry);
  Future<void> clearHistory() => delete(gameHistory).go();
}

@DriftAccessor(tables: [UserStats])
class UserStatsDao extends DatabaseAccessor<AppDatabase>
    with _$UserStatsDaoMixin {
  final AppDatabase db;
  UserStatsDao(this.db) : super(db);

  Future<UserStat?> getStats() => select(userStats).getSingleOrNull();
  Stream<UserStat?> watchStats() => select(userStats).watchSingleOrNull();
  Future<void> saveStats(UserStatsCompanion stats) =>
      into(userStats).insertOnConflictUpdate(stats);
  Future<void> resetStats() async {
    await update(userStats).write(const UserStatsCompanion(
      totalFlips: Value(0),
      headsCount: Value(0),
      tailsCount: Value(0),
      bestStreak: Value(0),
    ));
  }
}
