import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:flutter_architecture/src/widgets/button.dart';
import 'package:flutter_architecture/src/widgets/edit_text.dart';
import 'package:flutter_architecture/src/widgets/logo.dart';
import 'package:flutter_architecture/src/values/dimens.dart' as dimens;

class LoginWidget {
  Widget form({ BuildContext context, AuthBloc blocAuth }) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),

          SizedBox(height: 20),

          EditText(
            placeholder: "LOGIN",
            value: blocAuth.login,
            onChange: (value) => blocAuth.setLogin(value),
          ),

          SizedBox(height: 10),

          EditText(
            placeholder: "PASSWORD",
            value: blocAuth.password,
            onChange: (value) => blocAuth.setPassword(value),
          ),

          SizedBox(height: 20),

          CustomButton(
            label: "Sign In",
            onPress: () => blocAuth.signIn(),
          )
        ],
      ),
    );
  }
}