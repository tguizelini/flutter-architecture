import 'package:flutter_architecture/app/domain/http_response.dart';

abstract class IAccountRepository {
  Future<HttpResponse> login(String login, String senha);
}