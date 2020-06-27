import 'package:flutter_architecture/app/domain/http_response.dart';

abstract class IAuthRepository {
  Future<HttpResponse> login(String login, String senha);
}