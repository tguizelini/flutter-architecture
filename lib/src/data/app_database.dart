/*
import 'package:moor_flutter/moor_flutter.dart';
import 'tables/user_table.dart';
import 'daos/user_dao.dart';

part 'app_database.g.dart';

@UseMoor(
  tables: [ UserTable ],
  daos: [ UserDAO ]
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1; 
}
*/