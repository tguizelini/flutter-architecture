import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/presentation/viewmodels/account.viewmodel.dart';
import 'package:flutter_architecture/app/presentation/widgets/loading.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'login.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final vm = serviceLocator<AccountViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Loading(
        message: "Loading message",
        status: vm.isLoading,
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: SingleChildScrollView(
              child: Container(
                child: form(context, _scaffoldKey)
              ),
            )
          ),
        )
      );
    });
  }
}
