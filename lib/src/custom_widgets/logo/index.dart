import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  var _assetsImage = new AssetImage("assets/logo.png");

  @override
  Widget build(BuildContext context) {
    return Image(
      image: _assetsImage, 
      //height: 600,
      fit: BoxFit.cover
    );
  }
}
