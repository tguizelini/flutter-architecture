import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/app.dart';
import 'package:flutter_architecture/core/di/service_locator.dart';

void main() async {
  await setupLocator();
  runApp(App());
}