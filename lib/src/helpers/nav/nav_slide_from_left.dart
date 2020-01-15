import 'package:flutter/material.dart';

class NavSlideFromLeft extends PageRouteBuilder {
  final Widget page;
  
  NavSlideFromLeft({ this.page }) : 
    super(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return page;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return new SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(animation),
        child: child,
      );
    }
  );
}
