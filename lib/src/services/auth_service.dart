import 'package:flutter_architecture/src/models/response_model.dart';
import 'package:flutter_architecture/src/models/usuario_model.dart';
import '../helpers/http_helper.dart';

class AuthService {

  Future<UsuarioModel> login(String login, String senha, String escritorio) async {
    final String url = "";

    final UsuarioModel usuario = UsuarioModel();
    final ResponseModel response = ResponseModel();
    
    final res = HttpHelper.find(url);

    return UsuarioModel.fromJson(res as Map<String, dynamic>);
  }

}
