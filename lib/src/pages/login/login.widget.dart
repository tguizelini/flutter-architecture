import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:flutter_architecture/src/widgets/button.dart';
import 'package:flutter_architecture/src/widgets/edit_text.dart';
import 'package:flutter_architecture/src/widgets/logo.dart';
import 'package:flutter_architecture/src/values/dimens.dart' as dimens;

class LoginWidget {
  Widget form(BuildContext context, AuthBloc bloc) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),

          SizedBox(height: 20),

          EditText(
            placeholder: "LOGIN",
            value: bloc.login,
            onChange: (value) => bloc.setLogin(value),
          ),

          SizedBox(height: 10),

          EditText(
            placeholder: "PASSWORD",
            value: bloc.password,
            onChange: (value) => bloc.setPassword(value),
          ),

          SizedBox(height: 20),

          CustomButton(
            label: "Sign In",
            onPress: () => bloc.signIn(),
          )
        ],
      ),
    );
  }
}