import 'package:flutter_architecture/app/data/repositories/account.repository.dart';
import 'package:flutter_architecture/app/domain/http_response.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';
import 'package:mobx/mobx.dart';

part 'account.viewmodel.g.dart';

class AccountViewModel = _AccountViewModelBase with _$AccountViewModel;

abstract class _AccountViewModelBase with Store {
  final _uc = serviceLocator<AccountRepository>();
  
  @observable 
  bool isLoading = false;

  @action 
  _setLoading(bool value) => isLoading = value;

  @observable
  String login = "";

  @action
  setLogin(String value) => login = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;

  Future<bool> signIn() async {
    _setLoading(true);

    await Future.delayed(Duration(seconds: 2));

    HttpResponse ret = await _uc.login(login, password);

    _setLoading(false);
    
    if (ret.status == 200) {
      return true;
    }

    return false;
  }
}