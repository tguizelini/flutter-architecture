import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/theme.dart' as appTheme;

import 'package:flutter_architecture/src/pages/login/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme,
      home: LoginPage()
    );
  }
} 