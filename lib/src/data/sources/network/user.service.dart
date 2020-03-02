import 'package:flutter_architecture/src/application/device/http/http.helper.dart';
import 'package:flutter_architecture/src/data/mappers/user.mapper.dart';
import 'package:flutter_architecture/src/domain/models/response.model.dart';
import './base/endpoints.dart' as Endpoints;

class UserApiProvider{
  Future<ResponseModel> list() async {
    ResponseModel response = ResponseModel();

    final String url = Endpoints.myList.list;

    final ret= HttpHelper.get(url);

    await ret.then((res) {
      response.status = res.statusCode;
      response.data = UserMapper.fromJsonList(res.data);;
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
