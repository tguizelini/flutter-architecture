import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/presentation/pages/profile/profile.page.dart';
import 'package:flutter_architecture/app/presentation/viewmodels/account.viewmodel.dart';
import 'package:flutter_architecture/app/presentation/widgets/button.dart';
import 'package:flutter_architecture/app/presentation/widgets/edit_text.dart';
import 'package:flutter_architecture/app/presentation/widgets/logo.dart';
import 'package:flutter_architecture/app/presentation/widgets/snackbar.dart';
import 'package:flutter_architecture/app/presentation/widgets/text.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;
import 'package:flutter_architecture/device/nav/nav_slide_from_top.dart';

class LoginWidget {
  final vm = serviceLocator<AccountViewModel>();
  
  Widget form(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),

            Logo(),

            SizedBox(height: 20),

            EditText(
              placeholder: "LOGIN",
              value: vm.login,
              onChange: (value) => vm.setLogin(value),
            ),

            SizedBox(height: 10),

            EditText(
              placeholder: "SENHA",
              value: vm.password,
              onChange: (value) => vm.setPassword(value),
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
              onPressed: () => print("forgot password click"),
              child: CustomText(text: "Esqueci a senha", small: true,),
              ) 
            ),

            SizedBox(height: 12),

            CustomButton(
              label: "login",
              onPress: () async{
                final ret = await vm.signIn();

                if (ret) {
                  CustomSnackbar(key, message: "SUCCESS");
                } else {
                  CustomSnackbar(
                    key, 
                    error: true,
                    message: "NOT FOUND", 
                    actionMessage: "OK",
                    action: () {
                      print("ACTION CLICKED");
                    }
                  );
                }

                Navigator.pushReplacement(context, NavSlideFromTop(
                  page: ProfilePage()
                ));
              }
            ),


            SizedBox(height: 12),

            CustomButton(
              label: "cadastrar",
              transparent: true,
              onPress: () async{
                final ret = await vm.signIn();

                if (ret) {
                  CustomSnackbar(key, message: "SUCCESS");
                } else {
                  CustomSnackbar(
                    key, 
                    error: true,
                    message: "NOT FOUND", 
                    actionMessage: "OK",
                    action: () {
                      print("ACTION CLICKED");
                    }
                  );
                }

                Navigator.pushReplacement(context, NavSlideFromTop(
                  page: ProfilePage()
                ));
              }
            ),

            SizedBox(height: 12),

            CustomButton(
              facebook: true,
              label: "entrar com facebook",
              onPress: () async{
                final ret = await vm.signIn();

                if (ret) {
                  CustomSnackbar(key, message: "SUCCESS");
                } else {
                  CustomSnackbar(
                    key, 
                    error: true,
                    message: "NOT FOUND", 
                    actionMessage: "OK",
                    action: () {
                      print("ACTION CLICKED");
                    }
                  );
                }

                Navigator.pushReplacement(context, NavSlideFromTop(
                  page: ProfilePage()
                ));
              }
            )

          ],
        ),
      ),
    );
  }
}