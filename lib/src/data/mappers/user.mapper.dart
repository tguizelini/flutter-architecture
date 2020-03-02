import 'package:flutter_architecture/src/domain/models/user.model.dart';

class UserMapper{
  static List<UserModel> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as int,
      name: json["name"] as String
    );
  }
}