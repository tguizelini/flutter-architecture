import 'package:flutter_architecture/app/data/sources/network/auth.service.dart';
import 'package:flutter_architecture/app/domain/models/response.model.dart';
import 'package:flutter_architecture/app/domain/repositories/auth.repository.dart';
import 'package:flutter_architecture/core/device/connection/connection.helper.dart';

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
