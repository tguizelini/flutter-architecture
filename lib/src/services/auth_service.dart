import '../helpers/http_helper.dart';

import 'package:flutter_architecture/src/helpers/storage_helper.dart';
import 'package:flutter_architecture/src/utils/storage_keys.dart' as StorageKeys;

import 'package:flutter_architecture/src/models/response_model.dart';
import 'package:flutter_architecture/src/models/usuario_model.dart';

class AuthService {
  Future<ResponseModel> login(String login, String senha) async {
    ResponseModel response = ResponseModel();
    UsuarioModel user;
    
    final retAuth = HttpHelper.auth(login, senha);

    await retAuth.then((res) {
      String token = res.data["access_token"];
      StorageHelper.set(StorageKeys.token, token);
      StorageHelper.set(StorageKeys.login, login);
      StorageHelper.set(StorageKeys.senha, senha);

      user = UsuarioModel.fromJson(res.data);

      response.status = res.statusCode;
      response.data = user;
      response.message = res.statusMessage;
    })
    .catchError((e) {
      StorageHelper.set(StorageKeys.token, "");
      StorageHelper.set(StorageKeys.login, "");
      StorageHelper.set(StorageKeys.senha, "");

      print("e -> $e");
      
      response.status = 500;
      response.data = e;
      response.message = "Usuário não encontrado";
    });
    
    return response;
  }
}
