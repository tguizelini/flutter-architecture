import 'package:flutter_architecture/src/blocs/base/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/button/index.dart';
import 'package:flutter_architecture/src/custom-widgets/container_corner/index.dart';
import 'package:flutter_architecture/src/custom-widgets/container_with_margin/index.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input/index.dart';
import 'package:flutter_architecture/src/custom-widgets/edit_text/index.dart';
import 'package:flutter_architecture/src/custom-widgets/loading/index.dart';
import 'package:flutter_architecture/src/custom-widgets/logo/index.dart';
import 'package:flutter_architecture/src/custom-widgets/logo_ht7/index.dart';
import 'package:flutter_architecture/src/custom-widgets/text/index.dart';
import 'package:flutter_architecture/src/values/strings.dart' as strings;
import 'package:flutter_architecture/src/values/colors.dart' as colors;

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
              Expanded(
                flex: 1,
                child: Container(
                  child: Logo()
                )
              ),
              Expanded(
                flex: 2,
                child: ContainerCorner(
                  color: Colors.white,
                  child: ContainerWithMargin(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        EditText(
                          dark: true,
                          keyboardType: TextInputType.number,
                          value: bloc.login,
                          placeholder: "CPF",
                        ),
                        DividerInput(),
                        EditText(
                          dark: true,
                          password: true,
                          value: bloc.senha,
                          placeholder: "SENHA",
                        ),
                        DividerInput(),
                        DividerInput(),
                        CustomButton(
                          onPress: () => null,
                          label: "ENTRAR",
                        ),
                        DividerInput(),
                        DividerInput(),
                        DividerInput(),
                        DividerInput(),
                        CustomText(
                          dark: true,
                          small: true,
                          text: "ABOUT",
                        ),
                        CustomText(
                           accent: true,
                          small: true,
                          text: "ABOUT ACCENT",
                        ),
                        CustomText(
                          primaryDark: true,
                          small: true,
                          text: "ABOUT PRIMARY DARK",
                        ),
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
