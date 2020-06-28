import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/components/loading.dart';
import 'package:flutter_architecture/app/ui/modules/unauthenticated/login/login.viewmodel.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';
import 'login.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
  final vm = inject<LoginViewModel>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: vm.loading,
      builder: (context, snapshot) {
        return LoadingWidget( 
          message: "Loading message",
          status: snapshot.data,
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
      }
    );
  }
}
