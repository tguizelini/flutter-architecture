import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/application/di/service_locator.dart';
import 'package:flutter_architecture/src/application/values/theme.dart';
import 'package:flutter_architecture/src/presentation/pages/login/login.page.dart';

void main() {
  setupLocator();
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: LoginPage()
    )
  );
}