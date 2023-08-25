import 'package:mysql1/mysql1.dart';

import 'objects/user.dart';

class DatabaseHelper {
  final _host = 'myappdb.cqdrxu1v92x7.eu-north-1.rds.amazonaws.com';
  final _port = 3306;
  final _user = 'root';
  final _password = 'ellie8861';
  final _databaseName = 'powerliftingAppDB';

  Future<MySqlConnection> _getConnection() async {
    final settings = ConnectionSettings(
      host: _host,
      port: _port,
      user: _user,
      password: _password,
      db: _databaseName,
    );

    return await MySqlConnection.connect(settings);
  }

  Future<User?> getUserByUsername(String username) async {
    final conn = await _getConnection();

    final results = await conn.query(
      'SELECT * FROM User WHERE username = ?',
      [username],
    );

    await conn.close();

    if (results.isNotEmpty) {
      return User.fromMap(results.first.fields);
    } else {
      return null;
    }
  }
}
