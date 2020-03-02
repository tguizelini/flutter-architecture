import 'package:flutter_architecture/app/domain/models/response.model.dart';

abstract class IAuthRepository {
  Future<ResponseModel> login(String login, String senha);
}