import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/nav_bottom_bar/nav_bottom_bar.dart';
import 'package:flutter_architecture/src/custom-widgets/text.dart';
import 'package:flutter_architecture/src/custom-widgets/toolbar.dart';
import 'package:flutter_architecture/src/pages/login/login.dart';
import 'package:flutter_architecture/src/utils/navigation/nav_no_animation.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: "Page 2",
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushReplacement(context, NavNoAnimation(page: LoginPage()))
          ),
        ]
      ),

      body: Container(
        color: Colors.black12,
        child: Center(
          child: CustomText(text: "Page 2",)
        )
      ),

      bottomNavigationBar: CustomNavBottom(),
    ); 
  }
}