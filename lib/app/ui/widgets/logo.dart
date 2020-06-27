import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final bool header;
  final bool small;
  final bool challenge;

  const LogoWidget({Key key, this.challenge, this.small, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _logo = new AssetImage("assets/logo.png");
    var _logoHeader= new AssetImage("assets/logo_header.png");
    var _logoDark = new AssetImage("assets/logo_dark.png");

    final _finalLogoWidget = header == true ? 
          challenge == true ? _logoDark : _logoHeader 
        : 
          challenge == true ? _logoDark : _logo;

    return Image(
      image: _finalLogoWidget,
      width: small == true ? 100 : header == true ? 100 : 220,
      //fit: BoxFit.contain,
    );
  }
}
