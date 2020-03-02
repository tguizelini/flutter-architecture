import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';
import 'package:flutter_architecture/core/values/theme.dart';

import 'app/presentation/pages/login/login.page.dart';

void main() async {
  await setupLocator();
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: LoginPage()
    )
  );
}