import 'package:flutter_architecture/src/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';

import 'base/bloc_base.dart';
import 'base/validators.dart';

class LoginBloc extends BlocBase with Validators {
  AuthService _service = AuthService();

  final _escritorio = BehaviorSubject<String>.seeded("");
  final _codigo = BehaviorSubject<String>.seeded("");
  final _senha = BehaviorSubject<String>.seeded("");
  final _tab = BehaviorSubject<String>.seeded("associado");

  Observable<String> get escritorio => _escritorio.stream;
  Function(String) get setEscritorio => _escritorio.sink.add;

  Observable<String> get codigo => _codigo.stream;
  Function(String) get setCodigo => _codigo.sink.add;

  Observable<String> get senha => _senha.stream;
  Function(String) get setSenha => _senha.sink.add;

  Observable<String> get tab => _tab.stream;
  Function(String) get setTab => _tab.sink.add;

  Future<bool> login() async {
    setLoading(true);

    final ret = await _service.login(_codigo.value, _senha.value, _escritorio.value);

    setLoading(false);
    
    if (ret.status == 200) {
      return true;
    }

    return false;
  }

  void dispose() {
    _escritorio.close();
    _codigo.close();
    _senha.close();
    _tab.close();
  }
}
