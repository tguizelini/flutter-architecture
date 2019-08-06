import 'package:flutter_architecture/src/repositories/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

import '_base/bloc_base.dart';
import '_base/validators.dart';

class AuthBloc extends BlocBase with Validators {
  AuthRepository _service;

  final _login = BehaviorSubject<String>.seeded("");
  final _senha = BehaviorSubject<String>.seeded("");

  Observable<String> get login => _login.stream;
  Function(String) get setLogin => _login.sink.add;

  Observable<String> get senha => _senha.stream;
  Function(String) get setSenha => _senha.sink.add;

  Future<bool> signIn() async {
    setLoading(true);

    _service = AuthRepository();
    final ret = await _service.login(_login.value, _senha.value);

    setLoading(false);
    
    if (ret.status == 200) {
      return true;
    }

    return false;
  }

  @override
  void dispose() {
    _login.close();
    _senha.close();

    print("AuthBloc dispose called");
    
    super.dispose();
  }
}
