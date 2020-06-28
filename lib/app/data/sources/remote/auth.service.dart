import 'package:flutter_architecture/app/data/mappers/user.mapper.dart';
import 'package:flutter_architecture/app/data/sources/cache/storage.helper.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/core/di/http_client.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';

import './base/endpoints.dart' as Endpoints;

class AuthService{
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse> login(String login, String senha) async {
    HttpResponse response = HttpResponse();

    final String url = Endpoints.login.auth;

    final payload = {login, senha};
    
    final retAuth = client.post(url, body: payload);

    await retAuth.then((res) {
      String token = res.data["access_token"];
      StorageHelper.set(StorageKeys.token, token);
      StorageHelper.set(StorageKeys.login, login);
      StorageHelper.set(StorageKeys.senha, senha);

      response.statusCode = res.statusCode;
      response.data = UserMapper.fromJson(res.data);
      response.message = res.statusMessage;
    })
    .catchError((e) {
      StorageHelper.set(StorageKeys.token, "");
      StorageHelper.set(StorageKeys.login, "");
      StorageHelper.set(StorageKeys.senha, "");
      
      response.statusCode = 500;
      response.data = e;
      response.message = "User not found";
    });
    
    return response;
  }
}
