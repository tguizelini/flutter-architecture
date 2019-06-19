import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input.dart';
import 'package:flutter_architecture/src/custom-widgets/logo_ht7.dart';
import 'package:flutter_architecture/src/custom-widgets/text.dart';

class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LogoHt7(),

        DividerInput(),
        DividerInput(),
        
        CustomText(
          small: true,
          center: true,
          text: "Hare Krishna, Krishna krishna Hare Hare Hare Krishna, Krishna krishna Hare Hare",
        ),
      ],
    );
  }
}