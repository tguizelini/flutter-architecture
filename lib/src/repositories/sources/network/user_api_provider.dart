import 'package:flutter_architecture/src/helpers/http/http_helper.dart';
import 'package:flutter_architecture/src/models/response_model.dart';
import 'package:flutter_architecture/src/models/user_model.dart';
import './base/endpoints.dart' as Endpoints;

class UserApiProvider{
  Future<ResponseModel> list() async {
    ResponseModel response = ResponseModel();
    List<UserModel> user;

    final String url = Endpoints.myList.list;

    final ret= HttpHelper.get(url);

    await ret.then((res) {
      user = UserModel.fromJsonList(res.data);

      response.status = res.statusCode;
      response.data = user;
      response.message = res.statusMessage;
    })
    .catchError((e) {
      print("e -> $e");
      
      response.status = 500;
      response.data = e;
      response.message = "Server Error";
    });
    
    return response;
  }
}
