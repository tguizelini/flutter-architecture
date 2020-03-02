import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/presentation/viewmodels/login.viewmodel.dart';
import 'package:flutter_architecture/app/presentation/widgets/loading.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'login.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
  final vm = serviceLocator<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Loading(
        message: "Loading message",
        status: vm.isLoading,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: form(context)
            ),
          )
        )
      );
    });
  }
}
