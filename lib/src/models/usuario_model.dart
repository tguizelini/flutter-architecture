class UsuarioModel {
  final int id;
  final String name;

  UsuarioModel({ this.id, this.name });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json["id"] as int,
      name: json["name"] as String
    );
  }
}
