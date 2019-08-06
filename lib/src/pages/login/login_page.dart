import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:flutter_architecture/src/custom_widgets/loading.dart';
import 'package:flutter_architecture/src/pages/login/login_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
  AuthBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<AuthBloc>(context);
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Loading(
      message: "Loading message",
      status: _bloc.loading,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              header(context),
              form(context, _bloc)
            ]
            
          )
        )
      )
    );
  }
}
