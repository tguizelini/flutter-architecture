// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class user extends DataClass implements Insertable<user> {
  final int id;
  final String name;
  final int cpf;
  final bool active;
  user({@required this.id, this.name, this.cpf, this.active});
  factory user.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return user(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      cpf: intType.mapFromDatabaseResponse(data['${effectivePrefix}cpf']),
      active:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}active']),
    );
  }
  factory user.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return user(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      cpf: serializer.fromJson<int>(json['cpf']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'cpf': serializer.toJson<int>(cpf),
      'active': serializer.toJson<bool>(active),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<user>>(bool nullToAbsent) {
    return UserTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      cpf: cpf == null && nullToAbsent ? const Value.absent() : Value(cpf),
      active:
          active == null && nullToAbsent ? const Value.absent() : Value(active),
    ) as T;
  }

  user copyWith({int id, String name, int cpf, bool active}) => user(
        id: id ?? this.id,
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
        active: active ?? this.active,
      );
  @override
  String toString() {
    return (StringBuffer('user(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cpf: $cpf, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      $mrjc($mrjc($mrjc(0, id.hashCode), name.hashCode), cpf.hashCode),
      active.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is user &&
          other.id == id &&
          other.name == name &&
          other.cpf == cpf &&
          other.active == active);
}

class UserTableCompanion extends UpdateCompanion<user> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> cpf;
  final Value<bool> active;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.cpf = const Value.absent(),
    this.active = const Value.absent(),
  });
}

class $UserTableTable extends UserTable with TableInfo<$UserTableTable, user> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false, hasAutoIncrement: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _cpfMeta = const VerificationMeta('cpf');
  GeneratedIntColumn _cpf;
  @override
  GeneratedIntColumn get cpf => _cpf ??= _constructCpf();
  GeneratedIntColumn _constructCpf() {
    return GeneratedIntColumn(
      'cpf',
      $tableName,
      true,
    );
  }

  final VerificationMeta _activeMeta = const VerificationMeta('active');
  GeneratedBoolColumn _active;
  @override
  GeneratedBoolColumn get active => _active ??= _constructActive();
  GeneratedBoolColumn _constructActive() {
    return GeneratedBoolColumn(
      'active',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, cpf, active];
  @override
  $UserTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user_table';
  @override
  final String actualTableName = 'user_table';
  @override
  VerificationContext validateIntegrity(UserTableCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.cpf.present) {
      context.handle(_cpfMeta, cpf.isAcceptableValue(d.cpf.value, _cpfMeta));
    } else if (cpf.isRequired && isInserting) {
      context.missing(_cpfMeta);
    }
    if (d.active.present) {
      context.handle(
          _activeMeta, active.isAcceptableValue(d.active.value, _activeMeta));
    } else if (active.isRequired && isInserting) {
      context.missing(_activeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  user map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return user.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UserTableCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.cpf.present) {
      map['cpf'] = Variable<int, IntType>(d.cpf.value);
    }
    if (d.active.present) {
      map['active'] = Variable<bool, BoolType>(d.active.value);
    }
    return map;
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $UserTableTable _userTable;
  $UserTableTable get userTable => _userTable ??= $UserTableTable(this);
  UserDAO _userDAO;
  UserDAO get userDAO => _userDAO ??= UserDAO(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [userTable];
}
