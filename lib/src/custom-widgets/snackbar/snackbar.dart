import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/text.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;

class CustomSnackbar {
  SnackBar _snackbar;
  
  CustomSnackbar({ BuildContext context, String message, SnackBarAction action }) {
    this._snackbar = SnackBar(
      action: action,
      backgroundColor: colors.snackbarBackgroundColor,
      content: CustomText(
        white: true,
        bold: true,
        text: message,
      ),
    );

    Scaffold.of(context).showSnackBar(this._snackbar);
  }
}