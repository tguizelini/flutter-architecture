import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/presentation/controllers/login.controller.dart';
import 'package:flutter_architecture/app/presentation/widgets/loading.dart';

import 'login.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Loading(
      message: "Loading message",
      status: false,//bloc.loading,
      child: Scaffold(
        body: Container(
          child: form(context, controller)
        )
      )
    );
  }
}
