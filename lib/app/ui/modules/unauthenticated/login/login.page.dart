import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';
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
  final vm = inject<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return LoadingWidget(
        message: "Loading message",
        status: vm.loading,
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
