import 'package:flutter_architecture/src/data/local/daos/todo_dao.dart';
import 'package:flutter_architecture/src/data/network/user_api_provider.dart';
import 'package:flutter_architecture/src/helpers/connection_helper.dart';
import 'package:flutter_architecture/src/models/response_model.dart';

class UserRepository {
  UserApiProvider api= UserApiProvider();
  TodoDAO dao = TodoDAO();

  Future<ResponseModel> list() async {
    ResponseModel response = ResponseModel();

    response.status = 200;
    response.message = "OK";

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response.data = await this.api.list();
    } else {
      response.data = dao.getTodos();
    }

    return response;
  }
}
