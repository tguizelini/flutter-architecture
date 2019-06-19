import 'package:flutter_architecture/src/blocs/base/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/login_bloc.dart';
import 'package:flutter_architecture/src/custom-widgets/container_corner.dart';
import 'package:flutter_architecture/src/custom-widgets/container_with_margin.dart';
import 'package:flutter_architecture/src/custom-widgets/loading.dart';
import 'package:flutter_architecture/src/pages/login/login_footer.dart';
import 'package:flutter_architecture/src/pages/login/login_form.dart';
import 'package:flutter_architecture/src/pages/login/login_header.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = LoginBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Loading(
      message: "Loading message",
      status: bloc.loading,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,

        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginHeader(),
              Expanded(
                flex: 2,
                child: ContainerCorner(
                  color: Colors.white,
                  child: ContainerWithMargin(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LoginForm(bloc: bloc),
                        LoginFooter()
                      ],
                    ),
                  ),
                )
              )
            ],
            
          )
        )
      )
    );
  }
}
