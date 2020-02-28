import 'package:flutter_architecture/src/widgets/toast.dart';
import 'package:flutter_architecture/src/repositories/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  AuthRepository _repository = new AuthRepository();

  final _loading = BehaviorSubject<bool>();
  final _login = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Observable<bool> get loading => _loading.stream;
  void setLoading(bool value) => _loading.sink.add(value);

  Observable<String> get login => _login.stream;
  void setLogin(String value) => _login.sink.add(value);

  Observable<String> get password => _password.stream;
  void setPassword(String value) => _password.sink.add(value);

  void signIn() async {
    setLoading(true);

    final ret = await _repository.login(_login.value, _password.value);

    setLoading(false);
    
    if (ret.status == 200) {
      CustomToast.show("Success");
    }

    CustomToast.show(ret.message);
  }

  void dispose() {
    _loading.close();
    _login.close();
    _password.close();
  }
}
