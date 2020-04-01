import 'package:flutter_architecture/app/data/mappers/user.mapper.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/core/di/components/http_client.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';

import './base/endpoints.dart' as Endpoints;

class UserService{
  final client = serviceLocator<HttpClient>();
  
  Future<HttpResponse> list() async {
    HttpResponse response = HttpResponse();

    final String url = Endpoints.myList.list;

    final ret = client.get(url);

    await ret.then((res) {
      response.status = res.statusCode;
      response.data = UserMapper.fromJsonList(res.data);
      response.message = res.statusMessage;
    })
    .catchError((e) {
      response.status = 500;
      response.data = e;
      response.message = "Server Error";
    });
    
    return response;
  }
}
