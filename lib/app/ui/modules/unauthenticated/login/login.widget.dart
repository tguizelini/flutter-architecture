import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/modules/authenticated/home/home.page.dart';
import 'package:flutter_architecture/app/ui/widgets/button.dart';
import 'package:flutter_architecture/app/ui/widgets/input.dart';
import 'package:flutter_architecture/app/ui/widgets/logo.dart';
import 'package:flutter_architecture/app/ui/widgets/snackbar.dart';
import 'package:flutter_architecture/app/ui/widgets/text.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;
import 'package:flutter_architecture/device/nav/nav_slide_from_top.dart';

import 'login.viewmodel.dart';

class LoginWidget {
  final vm = inject<LoginViewModel>();

  Widget form(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),

            LogoWidget(),

            SizedBox(height: 20),

            StreamBuilder(
              stream: vm.login,
              builder: (context, snapshot) {
                return InputWidget(
                  placeholder: "LOGIN",
                  value: snapshot.data,
                  onChange: (value) => vm.setLogin(value),
                );
              }
            ),

            SizedBox(height: 10),

            StreamBuilder(
              stream: vm.password,
              builder: (context, snapshot) {
                return InputWidget(
                  placeholder: "SENHA",
                  value: snapshot.data,
                  onChange: (value) => vm.setPassword(value),
                );
              }
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
              onPressed: () => print("forgot password click"),
              child: TextWidget(text: "Esqueci a senha", small: true,),
              ) 
            ),

            SizedBox(height: 12),

            ButtonWidget(
              label: "login",
              onPress: () async{
                final ret = await vm.signIn();

                if (ret) {
                  SnackbarWidget(key, message: "SUCCESS");
                } else {
                  SnackbarWidget(
                    key, 
                    error: true,
                    message: "NOT FOUND", 
                    actionMessage: "OK",
                    action: () {
                      print("ACTION CLICKED");
                    }
                  );
                }


                await Future.delayed(Duration(seconds: 1));

                Navigator.pushReplacement(context, NavSlideFromTop(
                  page: HomePage()
                ));
              }
            ),


            SizedBox(height: 12),

            ButtonWidget(
              label: "cadastrar",
              transparent: true,
              onPress: () async{
                final ret = await vm.signIn();

                if (ret) {
                  SnackbarWidget(key, message: "SUCCESS");
                } else {
                  SnackbarWidget(
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
                  page: HomePage()
                ));
              }
            ),

            SizedBox(height: 12),

            ButtonWidget(
              facebook: true,
              label: "entrar com facebook",
              onPress: () async{
                final ret = await vm.signIn();

                if (ret) {
                  SnackbarWidget(key, message: "SUCCESS");
                } else {
                  SnackbarWidget(
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
                  page: HomePage()
                ));
              }
            )

          ],
        ),
      ),
    );
  }
}