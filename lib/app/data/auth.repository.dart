import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/app/domain/repositories/auth.repository.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';
import 'package:flutter_architecture/device/connection/connection.helper.dart';

import 'sources/remote/auth.service.dart';

class AuthRepository implements IAuthRepository {
  AuthService service = inject<AuthService>();

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
