
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:flutter_architecture/src/blocs/drawer_bloc.dart';
import 'package:provider/provider.dart';

class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthBloc(), lazy: false),
        ChangeNotifierProvider(create: (_) => DrawerBloc(), lazy: false)
      ],
      child: child
    );
  }
}