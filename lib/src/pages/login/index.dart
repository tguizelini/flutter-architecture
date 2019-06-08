import 'package:flutter_architecture/src/blocs/base/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/button/index.dart';
import 'package:flutter_architecture/src/custom-widgets/container_with_margin/index.dart';
import 'package:flutter_architecture/src/custom-widgets/drawer/index.dart';
import 'package:flutter_architecture/src/custom-widgets/edit_text/index.dart';
import 'package:flutter_architecture/src/custom-widgets/loading/index.dart';
import 'package:flutter_architecture/src/custom-widgets/logo/index.dart';
import 'package:flutter_architecture/src/custom-widgets/snackbar/index.dart';
import 'package:flutter_architecture/src/custom-widgets/tag/index.dart';
import 'package:flutter_architecture/src/custom-widgets/text/index.dart';
import 'package:flutter_architecture/src/custom-widgets/toast/index.dart';
import 'package:flutter_architecture/src/custom-widgets/toolbar/index.dart';
import 'package:flutter_architecture/src/values/strings.dart' as strings;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).login;

    return Loading(
      message: "doing something...",
      status: bloc.loading,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,

        drawer: CustomDrawer(),

        appBar: Toolbar(
          title: strings.login["title"],
        ),

        body: ContainerWithMargin(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ 
                    Logo(),
                    EditText(
                      placeholder: "Login",
                      value: bloc.login,
                    ),
                    CustomText(
                      title: true,
                      accent: true,
                      text: "Label",
                    ),
                    CustomText(
                      title: true,
                      primary: true,
                      text: "Label",
                    ),
                    CustomTag(
                      text: "Tag 1",
                    ),
                    CustomTag(
                      accent: true,
                      text: "Tag 2",
                    ),
                    CustomText(
                      title: true,
                      primaryDark: true,
                      text: "Label",
                    ),
                    CustomButton(
                      label: "Button Call Toast",
                      onPress: () => CustomToast.show("My Toast"),
                    ),
                    CustomButton(
                      primary: true,
                      label: "Button Call Toast",
                      onPress: () => CustomToast.show("My Toast"),
                    )
                ],
            ),
          ),
        )
      )
    );
  }
}
