
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:flutter_architecture/src/blocs/drawer_bloc.dart';
import 'package:provider/provider.dart';

import '../auth_bloc.dart';

class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return MultiProvider(
      providers: [
        Provider<AuthBloc>.value(value: new AuthBloc()),
        Provider<DrawerBloc>.value(value: new DrawerBloc())
      ],
      child: child
    );
  }
}