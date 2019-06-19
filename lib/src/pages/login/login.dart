import 'package:flutter_architecture/src/blocs/base/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/button.dart';
import 'package:flutter_architecture/src/custom-widgets/container_corner.dart';
import 'package:flutter_architecture/src/custom-widgets/container_with_margin.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input.dart';
import 'package:flutter_architecture/src/custom-widgets/edit_text.dart';
import 'package:flutter_architecture/src/custom-widgets/loading.dart';
import 'package:flutter_architecture/src/custom-widgets/logo.dart';
import 'package:flutter_architecture/src/custom-widgets/text.dart';

import 'package:flutter_architecture/src/pages/contact/contact.dart';
import 'package:flutter_architecture/src/pages/login/login_footer.dart';
import 'package:flutter_architecture/src/pages/login/login_form.dart';
import 'package:flutter_architecture/src/pages/login/login_header.dart';

import 'package:flutter_architecture/src/utils/navigation/nav_slide_from_top.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).login;

    return Loading(
      message: "doing something...",
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
