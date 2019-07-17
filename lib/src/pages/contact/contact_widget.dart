import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom_widgets/button.dart';
import 'package:flutter_architecture/src/custom_widgets/divider_field.dart';
import 'package:flutter_architecture/src/custom_widgets/edit_text.dart';
import 'package:flutter_architecture/src/custom_widgets/logo_ht7.dart';
import 'package:flutter_architecture/src/custom_widgets/text.dart';
import 'package:flutter_architecture/src/custom_widgets/toast.dart';

class ContactWidget {
  Widget header(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LogoHt7(),

        DividerField(),
        DividerField(),

        CustomText(
          small: true,
          center: true,
          text: "Hare Krishna, Krishna krishna Hare Hare Hare Krishna, Krishna krishna Hare Hare",
        ),

        DividerField(height: 50)
      ],
    );
  }

  Widget form(BuildContext context) {
    return Column(
      children: <Widget>[
        EditText(placeholder: "NAME"),

        DividerField(),

        EditText(placeholder: "WORK"),
        
        DividerField(),

        EditText(placeholder: "EMAIL"),

        DividerField(),

        EditText(multiline: true, placeholder: "MESSAGE"),

        DividerField(),
        DividerField(),
        
        CustomButton(
          onPress: () {
            CustomToast.show("MAIL SENT!");
            Navigator.pop(context);
          },
          label: "SENT",
        )
      ]
    );
  }
}