// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordHashMeta =
      const VerificationMeta('passwordHash');
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
      'password_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isVerifiedMeta =
      const VerificationMeta('isVerified');
  @override
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
      'is_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_verified" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, email, firstName, lastName, passwordHash, isVerified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
          _passwordHashMeta,
          passwordHash.isAcceptableOrUnknown(
              data['password_hash']!, _passwordHashMeta));
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('is_verified')) {
      context.handle(
          _isVerifiedMeta,
          isVerified.isAcceptableOrUnknown(
              data['is_verified']!, _isVerifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      passwordHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password_hash'])!,
      isVerified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_verified'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String passwordHash;
  final bool isVerified;
  const User(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.passwordHash,
      required this.isVerified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['password_hash'] = Variable<String>(passwordHash);
    map['is_verified'] = Variable<bool>(isVerified);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      email: Value(email),
      firstName: Value(firstName),
      lastName: Value(lastName),
      passwordHash: Value(passwordHash),
      isVerified: Value(isVerified),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'isVerified': serializer.toJson<bool>(isVerified),
    };
  }

  User copyWith(
          {int? id,
          String? username,
          String? email,
          String? firstName,
          String? lastName,
          String? passwordHash,
          bool? isVerified}) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        passwordHash: passwordHash ?? this.passwordHash,
        isVerified: isVerified ?? this.isVerified,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      isVerified:
          data.isVerified.present ? data.isVerified.value : this.isVerified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('isVerified: $isVerified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, username, email, firstName, lastName, passwordHash, isVerified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.email == this.email &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.passwordHash == this.passwordHash &&
          other.isVerified == this.isVerified);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> email;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> passwordHash;
  final Value<bool> isVerified;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.isVerified = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String passwordHash,
    this.isVerified = const Value.absent(),
  })  : username = Value(username),
        email = Value(email),
        firstName = Value(firstName),
        lastName = Value(lastName),
        passwordHash = Value(passwordHash);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? passwordHash,
    Expression<bool>? isVerified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (isVerified != null) 'is_verified': isVerified,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? email,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? passwordHash,
      Value<bool>? isVerified}) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      passwordHash: passwordHash ?? this.passwordHash,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('isVerified: $isVerified')
          ..write(')'))
        .toString();
  }
}

class $KullaniciTable extends Kullanici
    with TableInfo<$KullaniciTable, KullaniciRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KullaniciTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kullanici';
  @override
  VerificationContext validateIntegrity(Insertable<KullaniciRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KullaniciRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KullaniciRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $KullaniciTable createAlias(String alias) {
    return $KullaniciTable(attachedDatabase, alias);
  }
}

class KullaniciRow extends DataClass implements Insertable<KullaniciRow> {
  final int id;
  final DateTime createdAt;
  const KullaniciRow({required this.id, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  KullaniciCompanion toCompanion(bool nullToAbsent) {
    return KullaniciCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
    );
  }

  factory KullaniciRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KullaniciRow(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  KullaniciRow copyWith({int? id, DateTime? createdAt}) => KullaniciRow(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
      );
  KullaniciRow copyWithCompanion(KullaniciCompanion data) {
    return KullaniciRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KullaniciRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KullaniciRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt);
}

class KullaniciCompanion extends UpdateCompanion<KullaniciRow> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  const KullaniciCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  KullaniciCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
  }) : createdAt = Value(createdAt);
  static Insertable<KullaniciRow> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  KullaniciCompanion copyWith({Value<int>? id, Value<DateTime>? createdAt}) {
    return KullaniciCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KullaniciCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $GameHistoryTable extends GameHistory
    with TableInfo<$GameHistoryTable, GameHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _playedAtMeta =
      const VerificationMeta('playedAt');
  @override
  late final GeneratedColumn<DateTime> playedAt = GeneratedColumn<DateTime>(
      'played_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, result, playedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_history';
  @override
  VerificationContext validateIntegrity(Insertable<GameHistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    } else if (isInserting) {
      context.missing(_resultMeta);
    }
    if (data.containsKey('played_at')) {
      context.handle(_playedAtMeta,
          playedAt.isAcceptableOrUnknown(data['played_at']!, _playedAtMeta));
    } else if (isInserting) {
      context.missing(_playedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameHistoryEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result'])!,
      playedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}played_at'])!,
    );
  }

  @override
  $GameHistoryTable createAlias(String alias) {
    return $GameHistoryTable(attachedDatabase, alias);
  }
}

class GameHistoryEntry extends DataClass
    implements Insertable<GameHistoryEntry> {
  final int id;
  final String result;
  final DateTime playedAt;
  const GameHistoryEntry(
      {required this.id, required this.result, required this.playedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['result'] = Variable<String>(result);
    map['played_at'] = Variable<DateTime>(playedAt);
    return map;
  }

  GameHistoryCompanion toCompanion(bool nullToAbsent) {
    return GameHistoryCompanion(
      id: Value(id),
      result: Value(result),
      playedAt: Value(playedAt),
    );
  }

  factory GameHistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameHistoryEntry(
      id: serializer.fromJson<int>(json['id']),
      result: serializer.fromJson<String>(json['result']),
      playedAt: serializer.fromJson<DateTime>(json['playedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'result': serializer.toJson<String>(result),
      'playedAt': serializer.toJson<DateTime>(playedAt),
    };
  }

  GameHistoryEntry copyWith({int? id, String? result, DateTime? playedAt}) =>
      GameHistoryEntry(
        id: id ?? this.id,
        result: result ?? this.result,
        playedAt: playedAt ?? this.playedAt,
      );
  GameHistoryEntry copyWithCompanion(GameHistoryCompanion data) {
    return GameHistoryEntry(
      id: data.id.present ? data.id.value : this.id,
      result: data.result.present ? data.result.value : this.result,
      playedAt: data.playedAt.present ? data.playedAt.value : this.playedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameHistoryEntry(')
          ..write('id: $id, ')
          ..write('result: $result, ')
          ..write('playedAt: $playedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, result, playedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameHistoryEntry &&
          other.id == this.id &&
          other.result == this.result &&
          other.playedAt == this.playedAt);
}

class GameHistoryCompanion extends UpdateCompanion<GameHistoryEntry> {
  final Value<int> id;
  final Value<String> result;
  final Value<DateTime> playedAt;
  const GameHistoryCompanion({
    this.id = const Value.absent(),
    this.result = const Value.absent(),
    this.playedAt = const Value.absent(),
  });
  GameHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String result,
    required DateTime playedAt,
  })  : result = Value(result),
        playedAt = Value(playedAt);
  static Insertable<GameHistoryEntry> custom({
    Expression<int>? id,
    Expression<String>? result,
    Expression<DateTime>? playedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (result != null) 'result': result,
      if (playedAt != null) 'played_at': playedAt,
    });
  }

  GameHistoryCompanion copyWith(
      {Value<int>? id, Value<String>? result, Value<DateTime>? playedAt}) {
    return GameHistoryCompanion(
      id: id ?? this.id,
      result: result ?? this.result,
      playedAt: playedAt ?? this.playedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (playedAt.present) {
      map['played_at'] = Variable<DateTime>(playedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameHistoryCompanion(')
          ..write('id: $id, ')
          ..write('result: $result, ')
          ..write('playedAt: $playedAt')
          ..write(')'))
        .toString();
  }
}

class $UserStatsTable extends UserStats
    with TableInfo<$UserStatsTable, UserStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _totalFlipsMeta =
      const VerificationMeta('totalFlips');
  @override
  late final GeneratedColumn<int> totalFlips = GeneratedColumn<int>(
      'total_flips', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _headsCountMeta =
      const VerificationMeta('headsCount');
  @override
  late final GeneratedColumn<int> headsCount = GeneratedColumn<int>(
      'heads_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _tailsCountMeta =
      const VerificationMeta('tailsCount');
  @override
  late final GeneratedColumn<int> tailsCount = GeneratedColumn<int>(
      'tails_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _bestStreakMeta =
      const VerificationMeta('bestStreak');
  @override
  late final GeneratedColumn<int> bestStreak = GeneratedColumn<int>(
      'best_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, totalFlips, headsCount, tailsCount, bestStreak, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_stats';
  @override
  VerificationContext validateIntegrity(Insertable<UserStat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('total_flips')) {
      context.handle(
          _totalFlipsMeta,
          totalFlips.isAcceptableOrUnknown(
              data['total_flips']!, _totalFlipsMeta));
    }
    if (data.containsKey('heads_count')) {
      context.handle(
          _headsCountMeta,
          headsCount.isAcceptableOrUnknown(
              data['heads_count']!, _headsCountMeta));
    }
    if (data.containsKey('tails_count')) {
      context.handle(
          _tailsCountMeta,
          tailsCount.isAcceptableOrUnknown(
              data['tails_count']!, _tailsCountMeta));
    }
    if (data.containsKey('best_streak')) {
      context.handle(
          _bestStreakMeta,
          bestStreak.isAcceptableOrUnknown(
              data['best_streak']!, _bestStreakMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      totalFlips: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_flips'])!,
      headsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}heads_count'])!,
      tailsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tails_count'])!,
      bestStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}best_streak'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UserStatsTable createAlias(String alias) {
    return $UserStatsTable(attachedDatabase, alias);
  }
}

class UserStat extends DataClass implements Insertable<UserStat> {
  final int id;
  final int totalFlips;
  final int headsCount;
  final int tailsCount;
  final int bestStreak;
  final DateTime updatedAt;
  const UserStat(
      {required this.id,
      required this.totalFlips,
      required this.headsCount,
      required this.tailsCount,
      required this.bestStreak,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['total_flips'] = Variable<int>(totalFlips);
    map['heads_count'] = Variable<int>(headsCount);
    map['tails_count'] = Variable<int>(tailsCount);
    map['best_streak'] = Variable<int>(bestStreak);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserStatsCompanion toCompanion(bool nullToAbsent) {
    return UserStatsCompanion(
      id: Value(id),
      totalFlips: Value(totalFlips),
      headsCount: Value(headsCount),
      tailsCount: Value(tailsCount),
      bestStreak: Value(bestStreak),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserStat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserStat(
      id: serializer.fromJson<int>(json['id']),
      totalFlips: serializer.fromJson<int>(json['totalFlips']),
      headsCount: serializer.fromJson<int>(json['headsCount']),
      tailsCount: serializer.fromJson<int>(json['tailsCount']),
      bestStreak: serializer.fromJson<int>(json['bestStreak']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'totalFlips': serializer.toJson<int>(totalFlips),
      'headsCount': serializer.toJson<int>(headsCount),
      'tailsCount': serializer.toJson<int>(tailsCount),
      'bestStreak': serializer.toJson<int>(bestStreak),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserStat copyWith(
          {int? id,
          int? totalFlips,
          int? headsCount,
          int? tailsCount,
          int? bestStreak,
          DateTime? updatedAt}) =>
      UserStat(
        id: id ?? this.id,
        totalFlips: totalFlips ?? this.totalFlips,
        headsCount: headsCount ?? this.headsCount,
        tailsCount: tailsCount ?? this.tailsCount,
        bestStreak: bestStreak ?? this.bestStreak,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserStat copyWithCompanion(UserStatsCompanion data) {
    return UserStat(
      id: data.id.present ? data.id.value : this.id,
      totalFlips:
          data.totalFlips.present ? data.totalFlips.value : this.totalFlips,
      headsCount:
          data.headsCount.present ? data.headsCount.value : this.headsCount,
      tailsCount:
          data.tailsCount.present ? data.tailsCount.value : this.tailsCount,
      bestStreak:
          data.bestStreak.present ? data.bestStreak.value : this.bestStreak,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserStat(')
          ..write('id: $id, ')
          ..write('totalFlips: $totalFlips, ')
          ..write('headsCount: $headsCount, ')
          ..write('tailsCount: $tailsCount, ')
          ..write('bestStreak: $bestStreak, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, totalFlips, headsCount, tailsCount, bestStreak, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStat &&
          other.id == this.id &&
          other.totalFlips == this.totalFlips &&
          other.headsCount == this.headsCount &&
          other.tailsCount == this.tailsCount &&
          other.bestStreak == this.bestStreak &&
          other.updatedAt == this.updatedAt);
}

class UserStatsCompanion extends UpdateCompanion<UserStat> {
  final Value<int> id;
  final Value<int> totalFlips;
  final Value<int> headsCount;
  final Value<int> tailsCount;
  final Value<int> bestStreak;
  final Value<DateTime> updatedAt;
  const UserStatsCompanion({
    this.id = const Value.absent(),
    this.totalFlips = const Value.absent(),
    this.headsCount = const Value.absent(),
    this.tailsCount = const Value.absent(),
    this.bestStreak = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserStatsCompanion.insert({
    this.id = const Value.absent(),
    this.totalFlips = const Value.absent(),
    this.headsCount = const Value.absent(),
    this.tailsCount = const Value.absent(),
    this.bestStreak = const Value.absent(),
    required DateTime updatedAt,
  }) : updatedAt = Value(updatedAt);
  static Insertable<UserStat> custom({
    Expression<int>? id,
    Expression<int>? totalFlips,
    Expression<int>? headsCount,
    Expression<int>? tailsCount,
    Expression<int>? bestStreak,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (totalFlips != null) 'total_flips': totalFlips,
      if (headsCount != null) 'heads_count': headsCount,
      if (tailsCount != null) 'tails_count': tailsCount,
      if (bestStreak != null) 'best_streak': bestStreak,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserStatsCompanion copyWith(
      {Value<int>? id,
      Value<int>? totalFlips,
      Value<int>? headsCount,
      Value<int>? tailsCount,
      Value<int>? bestStreak,
      Value<DateTime>? updatedAt}) {
    return UserStatsCompanion(
      id: id ?? this.id,
      totalFlips: totalFlips ?? this.totalFlips,
      headsCount: headsCount ?? this.headsCount,
      tailsCount: tailsCount ?? this.tailsCount,
      bestStreak: bestStreak ?? this.bestStreak,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (totalFlips.present) {
      map['total_flips'] = Variable<int>(totalFlips.value);
    }
    if (headsCount.present) {
      map['heads_count'] = Variable<int>(headsCount.value);
    }
    if (tailsCount.present) {
      map['tails_count'] = Variable<int>(tailsCount.value);
    }
    if (bestStreak.present) {
      map['best_streak'] = Variable<int>(bestStreak.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserStatsCompanion(')
          ..write('id: $id, ')
          ..write('totalFlips: $totalFlips, ')
          ..write('headsCount: $headsCount, ')
          ..write('tailsCount: $tailsCount, ')
          ..write('bestStreak: $bestStreak, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $KullaniciTable kullanici = $KullaniciTable(this);
  late final $GameHistoryTable gameHistory = $GameHistoryTable(this);
  late final $UserStatsTable userStats = $UserStatsTable(this);
  late final UsersDao usersDao = UsersDao(this as AppDatabase);
  late final KullaniciDao kullaniciDao = KullaniciDao(this as AppDatabase);
  late final GameHistoryDao gameHistoryDao =
      GameHistoryDao(this as AppDatabase);
  late final UserStatsDao userStatsDao = UserStatsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, kullanici, gameHistory, userStats];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String username,
  required String email,
  required String firstName,
  required String lastName,
  required String passwordHash,
  Value<bool> isVerified,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> username,
  Value<String> email,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> passwordHash,
  Value<bool> isVerified,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => column);

  GeneratedColumn<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> passwordHash = const Value.absent(),
            Value<bool> isVerified = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            username: username,
            email: email,
            firstName: firstName,
            lastName: lastName,
            passwordHash: passwordHash,
            isVerified: isVerified,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String username,
            required String email,
            required String firstName,
            required String lastName,
            required String passwordHash,
            Value<bool> isVerified = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            username: username,
            email: email,
            firstName: firstName,
            lastName: lastName,
            passwordHash: passwordHash,
            isVerified: isVerified,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$KullaniciTableCreateCompanionBuilder = KullaniciCompanion Function({
  Value<int> id,
  required DateTime createdAt,
});
typedef $$KullaniciTableUpdateCompanionBuilder = KullaniciCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
});

class $$KullaniciTableFilterComposer
    extends Composer<_$AppDatabase, $KullaniciTable> {
  $$KullaniciTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$KullaniciTableOrderingComposer
    extends Composer<_$AppDatabase, $KullaniciTable> {
  $$KullaniciTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$KullaniciTableAnnotationComposer
    extends Composer<_$AppDatabase, $KullaniciTable> {
  $$KullaniciTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$KullaniciTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KullaniciTable,
    KullaniciRow,
    $$KullaniciTableFilterComposer,
    $$KullaniciTableOrderingComposer,
    $$KullaniciTableAnnotationComposer,
    $$KullaniciTableCreateCompanionBuilder,
    $$KullaniciTableUpdateCompanionBuilder,
    (
      KullaniciRow,
      BaseReferences<_$AppDatabase, $KullaniciTable, KullaniciRow>
    ),
    KullaniciRow,
    PrefetchHooks Function()> {
  $$KullaniciTableTableManager(_$AppDatabase db, $KullaniciTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KullaniciTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KullaniciTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KullaniciTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              KullaniciCompanion(
            id: id,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime createdAt,
          }) =>
              KullaniciCompanion.insert(
            id: id,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$KullaniciTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $KullaniciTable,
    KullaniciRow,
    $$KullaniciTableFilterComposer,
    $$KullaniciTableOrderingComposer,
    $$KullaniciTableAnnotationComposer,
    $$KullaniciTableCreateCompanionBuilder,
    $$KullaniciTableUpdateCompanionBuilder,
    (
      KullaniciRow,
      BaseReferences<_$AppDatabase, $KullaniciTable, KullaniciRow>
    ),
    KullaniciRow,
    PrefetchHooks Function()>;
typedef $$GameHistoryTableCreateCompanionBuilder = GameHistoryCompanion
    Function({
  Value<int> id,
  required String result,
  required DateTime playedAt,
});
typedef $$GameHistoryTableUpdateCompanionBuilder = GameHistoryCompanion
    Function({
  Value<int> id,
  Value<String> result,
  Value<DateTime> playedAt,
});

class $$GameHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $GameHistoryTable> {
  $$GameHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get playedAt => $composableBuilder(
      column: $table.playedAt, builder: (column) => ColumnFilters(column));
}

class $$GameHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $GameHistoryTable> {
  $$GameHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get playedAt => $composableBuilder(
      column: $table.playedAt, builder: (column) => ColumnOrderings(column));
}

class $$GameHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameHistoryTable> {
  $$GameHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<DateTime> get playedAt =>
      $composableBuilder(column: $table.playedAt, builder: (column) => column);
}

class $$GameHistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GameHistoryTable,
    GameHistoryEntry,
    $$GameHistoryTableFilterComposer,
    $$GameHistoryTableOrderingComposer,
    $$GameHistoryTableAnnotationComposer,
    $$GameHistoryTableCreateCompanionBuilder,
    $$GameHistoryTableUpdateCompanionBuilder,
    (
      GameHistoryEntry,
      BaseReferences<_$AppDatabase, $GameHistoryTable, GameHistoryEntry>
    ),
    GameHistoryEntry,
    PrefetchHooks Function()> {
  $$GameHistoryTableTableManager(_$AppDatabase db, $GameHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> result = const Value.absent(),
            Value<DateTime> playedAt = const Value.absent(),
          }) =>
              GameHistoryCompanion(
            id: id,
            result: result,
            playedAt: playedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String result,
            required DateTime playedAt,
          }) =>
              GameHistoryCompanion.insert(
            id: id,
            result: result,
            playedAt: playedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GameHistoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GameHistoryTable,
    GameHistoryEntry,
    $$GameHistoryTableFilterComposer,
    $$GameHistoryTableOrderingComposer,
    $$GameHistoryTableAnnotationComposer,
    $$GameHistoryTableCreateCompanionBuilder,
    $$GameHistoryTableUpdateCompanionBuilder,
    (
      GameHistoryEntry,
      BaseReferences<_$AppDatabase, $GameHistoryTable, GameHistoryEntry>
    ),
    GameHistoryEntry,
    PrefetchHooks Function()>;
typedef $$UserStatsTableCreateCompanionBuilder = UserStatsCompanion Function({
  Value<int> id,
  Value<int> totalFlips,
  Value<int> headsCount,
  Value<int> tailsCount,
  Value<int> bestStreak,
  required DateTime updatedAt,
});
typedef $$UserStatsTableUpdateCompanionBuilder = UserStatsCompanion Function({
  Value<int> id,
  Value<int> totalFlips,
  Value<int> headsCount,
  Value<int> tailsCount,
  Value<int> bestStreak,
  Value<DateTime> updatedAt,
});

class $$UserStatsTableFilterComposer
    extends Composer<_$AppDatabase, $UserStatsTable> {
  $$UserStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalFlips => $composableBuilder(
      column: $table.totalFlips, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get headsCount => $composableBuilder(
      column: $table.headsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tailsCount => $composableBuilder(
      column: $table.tailsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bestStreak => $composableBuilder(
      column: $table.bestStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$UserStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserStatsTable> {
  $$UserStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalFlips => $composableBuilder(
      column: $table.totalFlips, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get headsCount => $composableBuilder(
      column: $table.headsCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tailsCount => $composableBuilder(
      column: $table.tailsCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bestStreak => $composableBuilder(
      column: $table.bestStreak, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UserStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserStatsTable> {
  $$UserStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get totalFlips => $composableBuilder(
      column: $table.totalFlips, builder: (column) => column);

  GeneratedColumn<int> get headsCount => $composableBuilder(
      column: $table.headsCount, builder: (column) => column);

  GeneratedColumn<int> get tailsCount => $composableBuilder(
      column: $table.tailsCount, builder: (column) => column);

  GeneratedColumn<int> get bestStreak => $composableBuilder(
      column: $table.bestStreak, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserStatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserStatsTable,
    UserStat,
    $$UserStatsTableFilterComposer,
    $$UserStatsTableOrderingComposer,
    $$UserStatsTableAnnotationComposer,
    $$UserStatsTableCreateCompanionBuilder,
    $$UserStatsTableUpdateCompanionBuilder,
    (UserStat, BaseReferences<_$AppDatabase, $UserStatsTable, UserStat>),
    UserStat,
    PrefetchHooks Function()> {
  $$UserStatsTableTableManager(_$AppDatabase db, $UserStatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> totalFlips = const Value.absent(),
            Value<int> headsCount = const Value.absent(),
            Value<int> tailsCount = const Value.absent(),
            Value<int> bestStreak = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UserStatsCompanion(
            id: id,
            totalFlips: totalFlips,
            headsCount: headsCount,
            tailsCount: tailsCount,
            bestStreak: bestStreak,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> totalFlips = const Value.absent(),
            Value<int> headsCount = const Value.absent(),
            Value<int> tailsCount = const Value.absent(),
            Value<int> bestStreak = const Value.absent(),
            required DateTime updatedAt,
          }) =>
              UserStatsCompanion.insert(
            id: id,
            totalFlips: totalFlips,
            headsCount: headsCount,
            tailsCount: tailsCount,
            bestStreak: bestStreak,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserStatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserStatsTable,
    UserStat,
    $$UserStatsTableFilterComposer,
    $$UserStatsTableOrderingComposer,
    $$UserStatsTableAnnotationComposer,
    $$UserStatsTableCreateCompanionBuilder,
    $$UserStatsTableUpdateCompanionBuilder,
    (UserStat, BaseReferences<_$AppDatabase, $UserStatsTable, UserStat>),
    UserStat,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$KullaniciTableTableManager get kullanici =>
      $$KullaniciTableTableManager(_db, _db.kullanici);
  $$GameHistoryTableTableManager get gameHistory =>
      $$GameHistoryTableTableManager(_db, _db.gameHistory);
  $$UserStatsTableTableManager get userStats =>
      $$UserStatsTableTableManager(_db, _db.userStats);
}

mixin _$UsersDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
}
mixin _$KullaniciDaoMixin on DatabaseAccessor<AppDatabase> {
  $KullaniciTable get kullanici => attachedDatabase.kullanici;
}
mixin _$GameHistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $GameHistoryTable get gameHistory => attachedDatabase.gameHistory;
}
mixin _$UserStatsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserStatsTable get userStats => attachedDatabase.userStats;
}
