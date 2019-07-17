import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';

class AuthProvider extends StatelessWidget {
  final Widget child;

  const AuthProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => AuthBloc())
      ],
      child: child
    );
  }
}