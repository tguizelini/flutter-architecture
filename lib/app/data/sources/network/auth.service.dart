import 'package:flutter_architecture/app/data/mappers/user.mapper.dart';
import 'package:flutter_architecture/app/data/sources/storage/storage.helper.dart';
import 'package:flutter_architecture/app/data/sources/storage/storage.keys.dart';
import 'package:flutter_architecture/app/domain/models/response.model.dart';
import 'package:flutter_architecture/core/device/http/http.helper.dart';

import './base/endpoints.dart' as Endpoints;

class AuthService{
  Future<ResponseModel> login(String login, String senha) async {
    ResponseModel response = ResponseModel();

    final String url = Endpoints.login.auth;

    final payload = {login, senha};
    
    final retAuth = HttpHelper.post(url, body: payload);

    await retAuth.then((res) {
      String token = res.data["access_token"];
      StorageHelper.set(StorageKeys.token, token);
      StorageHelper.set(StorageKeys.login, login);
      StorageHelper.set(StorageKeys.senha, senha);

      response.status = res.statusCode;
      response.data = UserMapper.fromJson(res.data);
      response.message = res.statusMessage;
    })
    .catchError((e) {
      StorageHelper.set(StorageKeys.token, "");
      StorageHelper.set(StorageKeys.login, "");
      StorageHelper.set(StorageKeys.senha, "");
      
      response.status = 500;
      response.data = e;
      response.message = "User not found";
    });
    
    return response;
  }
}
