import 'package:flutter_architecture/app/domain/models/response.model.dart';
import 'package:flutter_architecture/app/domain/usecases/login.usecase.dart';
import 'package:flutter_architecture/app/presentation/widgets/toast.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';
import 'package:mobx/mobx.dart';

part 'login.viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final _uc = serviceLocator<LoginUseCase>();
  
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

  void signIn() async {
    _setLoading(true);

    ResponseModel ret = await _uc.login(login, password);

    _setLoading(false);
    
    if (ret.status == 200) {
      CustomToast.show("Success");
    }

    CustomToast.show(ret.message);
  }
}