import 'package:flutter/material.dart';

class CustomSnackbarAction {
  static SnackBarAction show({ String message, Function onPress }) {
    return SnackBarAction(
      label: message ?? "Snackbar message", 
      onPressed: onPress,
      textColor: Colors.white54,
    );
  }
}