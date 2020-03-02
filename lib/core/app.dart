import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/presentation/pages/login/login.page.dart';
import 'package:flutter_architecture/core/values/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: LoginPage()
    );
  }
} 