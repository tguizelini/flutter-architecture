class TodoTable {
  static final String tableName = 'todo';
  static final String columnId = '_id';
  static final String columnTitle = 'title';

  int id;
  String title;

  Map toJson() => {
    columnId: id,
    columnTitle: title
  };

  static List<TodoTable> fromJsonList(List<dynamic> json) => json.map((i) => TodoTable.fromJson(i)).toList();

  TodoTable.fromJson(Map<String, dynamic> json) {
    id = json[columnId];
    title = json[columnTitle];
  }

  static String create() {
    return "CREATE TABLE $tableName (" +
      "$tableName INTEGER PRIMARY KEY " +
      "$columnTitle TEXT" +
    ")";
  }
}
