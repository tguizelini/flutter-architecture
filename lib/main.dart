import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/app.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';

void main() async {
  setupInjection();
  runApp(App());
}