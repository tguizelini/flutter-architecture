
import 'package:flutter_architecture/app/data/repositories/account.repository.dart';
import 'package:flutter_architecture/app/domain/models/response.model.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';

class LoginUseCase {
  final AccountRepository repository = serviceLocator<AccountRepository>();

  Future<ResponseModel> login(String login, String password) async {
    // your business logic..
    final ret = await repository.login(login, password);
    return ret;
  }
}