import 'package:flutter_architecture/src/blocs/intimacao_bloc.dart';
import 'package:flutter_architecture/src/blocs/login_bloc.dart';
import 'package:flutter_architecture/src/blocs/nav_bottom_bloc.dart';

class BlocInject {
  LoginBloc _login = LoginBloc();
  IntimacaoBloc _intimacao = IntimacaoBloc();
  NavBottomBloc _navBottomBar = NavBottomBloc();

  LoginBloc get login => _login;
  IntimacaoBloc get intimacao => _intimacao;
  NavBottomBloc get navBottomBar => _navBottomBar;
}