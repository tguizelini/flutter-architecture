import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/logo.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Logo()
      )
    );
  }
}