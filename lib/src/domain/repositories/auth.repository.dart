import 'package:flutter_architecture/src/domain/models/response.model.dart';

abstract class IAuthRepository {
  Future<ResponseModel> login(String login, String senha);
}