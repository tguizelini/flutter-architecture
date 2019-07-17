import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:flutter_architecture/src/custom_widgets/loading.dart';
import 'package:flutter_architecture/src/pages/login/login_widget.dart';
import 'package:flutter_architecture/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AuthProvider(child: _LoginPage());
}

class _LoginPage extends StatelessWidget with LoginWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AuthBloc>(context);

    return Loading(
      message: "Loading message",
      status: bloc.loading,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              header(context),
              form(context, bloc)
            ]
            
          )
        )
      )
    );
  }
}
