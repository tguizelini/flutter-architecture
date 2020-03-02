import 'package:flutter_architecture/app/domain/models/response.model.dart';

abstract class IAccountRepository {
  Future<ResponseModel> login(String login, String senha);
}