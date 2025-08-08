import 'package:postgres/postgres.dart' as pg;

Future<void> main() async {
  final endpoint = pg.Endpoint(
    host: '49.12.188.137',
    port: 5432,
    database: 'melis_db',
    username: 'melis_db_user',
    password: 'xh2Ba1NhT2I9joJ4',
  );

  final conn = await pg.Connection.open(endpoint);
  try {
    await conn.execute(
      """
      ALTER TABLE IF EXISTS public.users
      ADD COLUMN IF NOT EXISTS is_verified boolean NOT NULL DEFAULT false;
      """,
    );
    print('OK: public.users.is_verified mevcut.');
  } finally {
    await conn.close();
  }
}
