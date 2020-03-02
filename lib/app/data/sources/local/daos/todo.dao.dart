import '../tables/todo.table.dart';
import 'package:sqflite/sqflite.dart';
import '../dbconfig.dart';

class TodoDAO{
  Database _db;

  TodoDAO() {
    _getDbInstance();
  }

  void _getDbInstance() async => _db = await DbConfig.getInstance();

  Future<TodoTable> insert(TodoTable todo) async {
    todo.id = await _db.insert(TodoTable.tableName, todo.toJson());
    return todo;
  }

  Future<List<TodoTable>> getTodos() async {
    List<TodoTable> list = [];

    List<Map> maps = await _db.query(
        TodoTable.tableName,
        columns: [TodoTable.columnId, TodoTable.columnTitle]
    );

    if (maps.length > 0) list = TodoTable.fromJsonList(maps);

    return list;
  }

  Future<TodoTable> getTodo(int id) async {
    List<Map> maps = await _db.query(TodoTable.tableName,
        columns: [TodoTable.columnId, TodoTable.columnTitle],
        where: '${TodoTable.columnId} = ?',
        whereArgs: [id]
    );

    if (maps.length > 0) {
      return TodoTable.fromJson(maps.first);
    }

    return null;
  }

  Future<int> delete(int id) async => await _db.delete(
      TodoTable.tableName,
      where: '${TodoTable.columnId} = ?', whereArgs: [id]
  );

  Future<int> update(TodoTable todo) async => await _db.update(
      TodoTable.tableName,
      todo.toJson(),
      where: '${TodoTable.columnId} = ?', whereArgs: [todo.id]
  );

  Future close() async => _db.close();
}