import 'dart:async';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _loginController = StreamController<String>();

  Sink<String> get codigoSink => _loginController.sink;

  final _codigoFlux = BehaviorSubject<String>();
  Stream<String> get codigoStream => _codigoFlux.stream;

}
