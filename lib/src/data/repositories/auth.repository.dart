import 'package:flutter_architecture/src/data/sources/network/auth.service.dart';
import 'package:flutter_architecture/src/application/device/connection/connection.helper.dart';
import 'package:flutter_architecture/src/domain/models/response.model.dart';
import 'package:flutter_architecture/src/domain/repositories/auth.repository.dart';

class AuthRepository implements IAuthRepository {
  AuthService api = AuthService();

  @override
  Future<ResponseModel> login(String login, String senha) async {
    ResponseModel response = ResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.api.login(login, senha);
    } else {
      response.message = "Device offline";
    }

    return response;
  }

}
