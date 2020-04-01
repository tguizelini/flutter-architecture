import 'package:flutter_architecture/app/data/sources/network/auth.service.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/app/domain/repositories/account.repository.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';
import 'package:flutter_architecture/device/connection/connection.helper.dart';

class AccountRepository implements IAccountRepository {
  AuthService service = serviceLocator<AuthService>();

  @override
  Future<HttpResponse> login(String login, String senha) async {
    HttpResponse response = HttpResponse();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.service.login(login, senha);
    } else {
      response.message = "Device offline";
    }

    return response;
  }

}
