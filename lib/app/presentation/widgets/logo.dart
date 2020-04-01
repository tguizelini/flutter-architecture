import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final bool header;
  final bool small;
  final bool challenge;

  const Logo({Key key, this.challenge, this.small, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _logo = new AssetImage("assets/logo.png");
    var _logoHeader= new AssetImage("assets/logo_header.png");
    var _logoDark = new AssetImage("assets/logo_dark.png");

    final _finalLogo = header == true ? 
          challenge == true ? _logoDark : _logoHeader 
        : 
          challenge == true ? _logoDark : _logo;

    return Image(
      image: _finalLogo,
      width: small == true ? 100 : header == true ? 100 : 220,
      //fit: BoxFit.contain,
    );
  }
}
