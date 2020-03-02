import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/application/values/dimens.dart' as dimens;
import 'package:flutter_architecture/src/presentation/controllers/login.controller.dart';
import 'package:flutter_architecture/src/presentation/widgets/button.dart';
import 'package:flutter_architecture/src/presentation/widgets/edit_text.dart';
import 'package:flutter_architecture/src/presentation/widgets/logo.dart';

class LoginWidget {
  Widget form(BuildContext context, LoginController controller) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),

          SizedBox(height: 20),

          EditText(
            placeholder: "LOGIN",
            value: controller.login,
            onChange: (value) => controller.setLogin(value),
          ),

          SizedBox(height: 10),

          EditText(
            placeholder: "PASSWORD",
            value: controller.password,
            onChange: (value) => controller.setPassword(value),
          ),

          SizedBox(height: 20),

          CustomButton(
            label: "Sign In",
            onPress: () => controller.signIn(),
          )
        ],
      ),
    );
  }
}