import 'package:flutter_architecture/app/data/auth.repository.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/core/base/view_model.base.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'login.viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel {
  final _uc = inject<AuthRepository>();
  
  @observable
  String login = "";

  @action 
  setLogin(String value) => login = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;

  Future<bool> signIn() async {
    setLoading(true);

    await Future.delayed(Duration(seconds: 2));

    HttpResponse ret = await _uc.login(login, password);

    setLoading(false);
    
    if (ret.statusCode == 200) {
      return true;
    }

    return false;
  }
}