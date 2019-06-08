import '../helpers/http_helper.dart';

import 'package:flutter_architecture/src/helpers/storage_helper.dart';
import 'package:flutter_architecture/src/utils/storage_keys.dart';

import 'package:flutter_architecture/src/models/response_model.dart';
import 'package:flutter_architecture/src/models/usuario_model.dart';

import 'base_url.dart';

class AuthService {
  Future<ResponseModel> login(String login, String senha) async {
    ResponseModel response = ResponseModel();
    UsuarioModel user;

    //await StorageHelper.set(StorageKeys.token, "");
    
    final retAuth = HttpHelper.auth(login, senha);

    await retAuth.then((res) {
      //String token = res.data["access_token"];
      //StorageHelper.set(StorageKeys.token, token);

      user = UsuarioModel.fromJson(res.data);

      response.status = res.statusCode;
      response.data = user;
      response.message = res.statusMessage;
    })
    .catchError((e) {
      StorageHelper.set(StorageKeys.token, "");

      print("e -> $e");
      
      response.status = 500;
      response.data = e;
      response.message = "Usuário não encontrado";
    });
    
    return response;
  }
}
// 