import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/modules/unauthenticated/login/login.page.dart';
import 'package:flutter_architecture/app/ui/widgets/button.dart';
import 'package:flutter_architecture/app/ui/widgets/text.dart';

import '../../../../../device/nav/nav_slide_from_left.dart';
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextWidget(text: "Home Page"),
            SizedBox(height: dimens.fieldSpace),
            ButtonWidget(
              label: "Go to Login Page",
              onPress: () => Navigator.pushReplacement(context, NavSlideFromLeft(
                page: LoginPage()
              )),
            )
          ],
        ),
      ),
    );
  }
}