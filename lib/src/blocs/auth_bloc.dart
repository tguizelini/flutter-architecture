import 'package:flutter_architecture/src/widgets/toast.dart';
import 'package:flutter_architecture/src/repositories/auth_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'base/bloc_base.dart';

class AuthBloc extends BlocBase {
  AuthRepository _service = AuthRepository();

  final _login = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Observable<String> get login => _login.stream;
  void setLogin(String value) => _login.sink.add(value);

  Observable<String> get password => _password.stream;
  void setPassword(String value) => _password.sink.add(value);

  void signIn() async {
    setLoading(true);
    final ret = await _service.login(_login.value, _password.value);
    setLoading(false);
    
    if (ret.status == 200) {
      CustomToast.show("Success");
    }

    CustomToast.show(ret.message);
  }

  @override
  void dispose() {
    _login.close();
    _password.close();

    super.dispose();
  }
}
