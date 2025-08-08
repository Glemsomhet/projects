import 'package:coin_flip/app/data/drift_database.dart';
import 'package:postgres/postgres.dart' as pg;

Future<void> main() async {
  // Drift açılmadan önce şema uyumluluğu düzeltmesi: public.kullanici.created_at
  final endpoint = pg.Endpoint(
    host: '49.12.188.137',
    port: 5432,
    database: 'melis_db',
    username: 'melis_db_user',
    password: 'xh2Ba1NhT2I9joJ4',
  );
  final conn = await pg.Connection.open(endpoint);
  try {
    // Mevcut tür ve default'u yazdır
    final before = await conn.execute(
      r"""
      SELECT data_type, column_default
      FROM information_schema.columns
      WHERE table_schema = 'public' AND table_name = 'kullanici' AND column_name = 'created_at'
      """,
    );
    if (before.isNotEmpty) {
      print('kullanici.created_at BEFORE -> type: ' +
          (before.first[0]?.toString() ?? 'null') +
          ', default: ' +
          (before.first[1]?.toString() ?? 'null'));
    } else {
      print('kullanici.created_at BEFORE -> bulunamadı');
    }

    await conn.execute(
      r"""
      DO $$
      BEGIN
        IF EXISTS (
          SELECT 1
          FROM information_schema.columns
          WHERE table_schema = 'public'
            AND table_name = 'kullanici'
            AND column_name = 'created_at'
            AND data_type = 'bigint'
        ) THEN
          EXECUTE 'ALTER TABLE public.kullanici ALTER COLUMN created_at DROP DEFAULT';
          EXECUTE 'ALTER TABLE public.kullanici ALTER COLUMN created_at TYPE timestamptz USING to_timestamp(created_at)';
          EXECUTE 'ALTER TABLE public.kullanici ALTER COLUMN created_at SET DEFAULT now()';
        END IF;
      END
      $$;
      """,
    );

    final after = await conn.execute(
      r"""
      SELECT data_type, column_default
      FROM information_schema.columns
      WHERE table_schema = 'public' AND table_name = 'kullanici' AND column_name = 'created_at'
      """,
    );
    if (after.isNotEmpty) {
      print('kullanici.created_at AFTER -> type: ' +
          (after.first[0]?.toString() ?? 'null') +
          ', default: ' +
          (after.first[1]?.toString() ?? 'null'));
    } else {
      print('kullanici.created_at AFTER -> bulunamadı');
    }
  } finally {
    await conn.close();
  }

  final db = AppDatabase();
  try {
    // Herhangi bir sorgu tetikleyerek migrasyonları çalıştır.
    await db.customSelect('SELECT 1').get();

    // Tablo mevcut mu kontrolü
    final existsRes = await db.customSelect(
      """
      SELECT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'public' AND table_name = 'kullanici'
      ) AS exists;
      """,
    ).getSingle();

    final exists = existsRes.data['exists'] as bool? ?? false;
    if (exists) {
      print('OK: public.kullanici tablosu mevcut.');
    } else {
      print(
          'UYARI: public.kullanici bulunamadı. Migrasyon tekrar deneniyor...');
    }

    print('Drift schemaVersion: ${db.schemaVersion}');
  } finally {
    await db.close();
  }
}
