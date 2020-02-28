import 'package:flutter_architecture/src/repositories/sources/local/tables/todo_table.dart';
import 'package:sqflite/sqflite.dart';

class DbConfig {
  static Database _db;

  static Future<Database> getInstance() async {
    if (_db == null) {
      _db = await openDatabase('my_db.db', version: 1, onCreate: (Database db, int version) async {

        await db.execute(
          TodoTable.create()
        );

      });
    }

    return _db;
  }

  static close() async {
    await _db.close();
  }
}