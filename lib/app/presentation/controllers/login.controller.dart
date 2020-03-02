import 'package:flutter_architecture/app/domain/models/response.model.dart';
import 'package:flutter_architecture/app/domain/usecases/login.usecase.dart';
import 'package:flutter_architecture/app/presentation/stores/user.store.dart';
import 'package:flutter_architecture/app/presentation/widgets/toast.dart';
import 'package:flutter_architecture/core/di/components/app_store.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';

class LoginController {
  final LoginUseCase uc = serviceLocator<LoginUseCase>();
  final UserStore store = serviceLocator<AppStore>().user;
  
  void signIn() async {
    store.setLoading(true);

    ResponseModel ret = await uc.login(store.login, store.password);

    store.setLoading(false);
    
    if (ret.status == 200) {
      CustomToast.show("Success");
    }

    CustomToast.show(ret.message);
  }
}
