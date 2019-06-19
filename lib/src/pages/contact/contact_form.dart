import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/button.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input.dart';
import 'package:flutter_architecture/src/custom-widgets/edit_text.dart';
import 'package:flutter_architecture/src/custom-widgets/toast.dart';

class ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EditText(
          placeholder: "NAME",
        ),
        DividerInput(),
        EditText(
          placeholder: "WORK",
        ),
        DividerInput(),
        EditText(
          placeholder: "EMAIL",
        ),
        DividerInput(),
        EditText(
          multiline: true,
          placeholder: "MESSAGE",
        ),
        DividerInput(),
        DividerInput(),
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