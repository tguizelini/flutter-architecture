import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/button.dart';
import 'package:flutter_architecture/src/custom-widgets/container_with_margin.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input.dart';
import 'package:flutter_architecture/src/custom-widgets/edit_text.dart';
import 'package:flutter_architecture/src/custom-widgets/logo_ht7.dart';
import 'package:flutter_architecture/src/custom-widgets/text.dart';
import 'package:flutter_architecture/src/custom-widgets/toast.dart';
import 'package:flutter_architecture/src/custom-widgets/toolbar.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: "Contact",
      ),

      body: ContainerWithMargin(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
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
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
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
                ])
              ,
            )
          ],
        ),
      ),
    );
  }
}