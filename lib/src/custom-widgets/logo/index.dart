import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  var _assetsImage = new AssetImage("assets/logo.png");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
          child: Image(
            image: _assetsImage, 
            fit: BoxFit.fitHeight
          ),
    );
  }
}