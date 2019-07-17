import '../app_database.dart';
import 'package:flutter_architecture/src/data/tables/user_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

@UseDao(tables: [ UserTable ])
class UserDAO extends DatabaseAccessor<AppDatabase> {
  UserDAO(AppDatabase db) : super(db);

  //Future<List<IntimacaoTable>> get list => null;
}
