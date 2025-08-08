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
    final rows = await conn.execute(
      r"""
      SELECT table_name, column_name, data_type, column_default
      FROM information_schema.columns
      WHERE table_schema = 'public' AND column_name = 'created_at'
      ORDER BY table_name;
      """,
    );
    for (final r in rows) {
      print('table=${r[0]} column=${r[1]} type=${r[2]} default=${r[3]}');
    }
  } finally {
    await conn.close();
  }
}
