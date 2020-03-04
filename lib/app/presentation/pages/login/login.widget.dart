import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/presentation/viewmodels/login.viewmodel.dart';
import 'package:flutter_architecture/app/presentation/widgets/button.dart';
import 'package:flutter_architecture/app/presentation/widgets/edit_text.dart';
import 'package:flutter_architecture/app/presentation/widgets/logo.dart';
import 'package:flutter_architecture/app/presentation/widgets/snackbar.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;

class LoginWidget {
  final vm = serviceLocator<LoginViewModel>();
  
  Widget form(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),

          SizedBox(height: 20),

          EditText(
            placeholder: "LOGIN",
            value: vm.login,
            onChange: (value) => vm.setLogin(value),
          ),

          SizedBox(height: 10),

          EditText(
            placeholder: "PASSWORD",
            value: vm.password,
            onChange: (value) => vm.setPassword(value),
          ),

          SizedBox(height: 20),

          CustomButton(
            label: "Sign In",
            onPress: () async{
              final ret = await vm.signIn();

              if (ret) {
                CustomSnackbar(scaffoldKey, message: "SUCCESS");
              } else {
                CustomSnackbar(scaffoldKey, message: "NOT FOUND");
              }
            }
          )
        ],
      ),
    );
  }
}