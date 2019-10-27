import 'package:flutter/material.dart';

class LogoHt7 extends StatelessWidget {
  final _assetsImage = new AssetImage("assets/logo_ht7.png");

  @override
  Widget build(BuildContext context) {
    return Image(
      image: _assetsImage, 
      //height: 600,
      fit: BoxFit.cover,
    );
  }
}
