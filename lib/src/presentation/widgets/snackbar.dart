import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/application/values/colors.dart' as colors;
import 'package:flutter_architecture/src/presentation/widgets/text.dart';
/*
class CustomSnackbarAction {
  static SnackBarAction show({ String message, Function onPress }) {
    return SnackBarAction(
      label: message ?? "Snackbar message",
      onPressed: onPress,
      textColor: Colors.white54,
    );
  }
}
*/
class CustomSnackbar {
  SnackBar _snackbar;

  CustomSnackbar ({ BuildContext context, String message, SnackBarAction action }) {
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