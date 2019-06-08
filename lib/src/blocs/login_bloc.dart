import 'package:flutter_architecture/src/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';

import 'base/bloc_base.dart';
import 'base/validators.dart';

class LoginBloc extends BlocBase with Validators {
  AuthService _service = AuthService();

  final _login = BehaviorSubject<String>.seeded("");
  final _senha = BehaviorSubject<String>.seeded("");

  Observable<String> get login => _login.stream;
  Function(String) get setLogin => _login.sink.add;

  Observable<String> get senha => _senha.stream;
  Function(String) get setSenha => _senha.sink.add;

  Future<bool> signIn() async {
    setLoading(true);

    final ret = await _service.login(_login.value, _senha.value);

    setLoading(false);
    
    if (ret.status == 200) {
      return true;
    }

    return false;
  }

  void dispose() {
    _login.close();
    _senha.close();
  }
}
