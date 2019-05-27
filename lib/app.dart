import 'package:flutter/material.dart';

import 'values/strings.dart' as strings;
import 'package:flutter_architecture/values/theme.dart' as appTheme;

import 'package:flutter_architecture/pages/login/index.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme,
      home: Login()
    );
  }
} 