import 'package:flutter/material.dart';

import 'blocs/base/bloc_provider.dart';
import 'values/strings.dart' as strings;
import 'package:flutter_architecture/src/values/theme.dart' as appTheme;

import 'package:flutter_architecture/src/pages/login/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: strings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: appTheme.theme,
        home: LoginPage()
      )
    );
  }
} 