
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:flutter_architecture/src/blocs/drawer_bloc.dart';
import 'package:flutter_architecture/src/blocs/nav_bottom_bloc.dart';
import 'package:flutter_architecture/src/data/app_database.dart';
import 'package:provider/provider.dart';

class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(builder: (context) => AppDatabase()),
        ChangeNotifierProvider(builder: (context) => AuthBloc()),
        ChangeNotifierProvider(builder: (context) => DrawerBloc()),
        ChangeNotifierProvider(builder: (context) => NavBottomBloc()),
      ],
      child: child,
    );
  }
}