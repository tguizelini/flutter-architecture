import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_architecture/app/ui/components/loading.dart';
import 'login.viewmodel.dart';
import 'login.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final vm = serviceLocator<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return LoadingWidget(
        message: "LoadingWidget message",
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
