import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:flutter_architecture/src/widgets/loading.dart';
import 'package:flutter_architecture/src/pages/login/login_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
  AuthBloc blocAuth;

  @override
  void didChangeDependencies() {
    blocAuth = Provider.of<AuthBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    blocAuth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Loading(
      message: "Loading message",
      status: blocAuth.loading,
      child: Scaffold(
        body: Container(
          child: form(context: context, blocAuth: blocAuth)
        )
      )
    );
  }
}
