import 'package:flutter/material.dart';
import 'button.dart';
import 'divider_field.dart';
import 'text.dart';

class Modal {
  static void show(
    BuildContext context, 
    { 
      IconData icon,
      String title, 
      Widget body, 
      String confirmLabel, 
      Function confirmOnPress,
      String cancelLabel, 
      Function cancelOnPress 
    }) =>
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) =>
          AlertDialog(
            title: icon == null ?
             title == null ? null : CustomText(text: title)
            :
              Row(
                children: <Widget>[
                  Icon(icon), 
                  DividerField(width: 8.0),
                  CustomText(text: title ?? "")
                ]
              ),
            content: body != null ? SingleChildScrollView(child: body) : null,
            actions: <Widget>[
              //CANCEL BUTTON
              if (cancelLabel != null)
                FlatButton(
                  child: CustomText(text: cancelLabel ?? "Button Label", accent: true),
                  onPressed: () {
                    if (cancelOnPress != null) cancelOnPress();
                    Navigator.pop(context);
                  }
                ),

              //CONFIRM BUTTONS
              if (confirmLabel != null && cancelLabel == null)
                FlatButton(
                  child: CustomText(text: confirmLabel ?? "Button Label", accent: true),
                  onPressed: () {
                    if (confirmOnPress != null) confirmOnPress();
                    Navigator.pop(context);
                  }
                ),

              if (cancelLabel != null)
                CustomButton(
                  label: confirmLabel,
                  onPress: () {
                    if (confirmOnPress != null) confirmOnPress();
                    Navigator.pop(context);
                  },
                )
            ],
          )
      );
}