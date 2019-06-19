import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/text.dart';

class LoginFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
        )
      ],
    );
  }
}