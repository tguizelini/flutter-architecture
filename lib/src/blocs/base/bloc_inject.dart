import 'package:flutter_architecture/src/blocs/login_bloc.dart';
import 'package:flutter_architecture/src/blocs/nav_bottom_bloc.dart';

class BlocInject {
  LoginBloc _login = LoginBloc();
  NavBottomBloc _navBottomBar = NavBottomBloc();

  LoginBloc get login => _login;
  NavBottomBloc get navBottomBar => _navBottomBar;
}