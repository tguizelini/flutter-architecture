import '../helpers/http_helper.dart';

import 'package:flutter_architecture/src/utils/jwt_util.dart';
import 'package:flutter_architecture/src/helpers/storage_helper.dart';
import 'package:flutter_architecture/src/utils/storage_keys.dart';

import 'package:flutter_architecture/src/models/response_model.dart';
import 'package:flutter_architecture/src/models/usuario_model.dart';

class AuthService {
  Future<ResponseModel> login(String codigo, String senha, String escritorio) async {
    ResponseModel response = ResponseModel();
    UsuarioModel user;

    await StorageHelper.set(StorageKeys.token, "");
    
    final retAuth = HttpHelper.auth(codigo, senha, "");

    await retAuth.then((res) {
      String token = res.data["access_token"];
      StorageHelper.set(StorageKeys.token, token);

      final decoded = JwtUtil.decode(token);
      user = UsuarioModel.fromJson(decoded);

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