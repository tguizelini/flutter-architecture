import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom_widgets/button.dart';
import 'package:flutter_architecture/src/custom_widgets/text.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[0],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomText(
            accent: true,
            small: true,
            text: "ACCENT COLOR",
          ),
          CustomText(
            small: true,
            text: "PRIMARY COLOR",
          ),
          CustomText(
            small: true,
            primaryDark: true,
            text: "PRIMARY DARK COLOR",
          ),
          CustomText(
            small: true,
            dark: true,
            text: "DARK COLOR",
          ),
          CustomButton(
            primary: true,
            label: "Primary Button",
            onPress: () => null,
          ),
          CustomButton(
            label: "Default Button",
            onPress: () => null,
          )
        ]
      )
    );
  }
}