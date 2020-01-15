import 'package:flutter/material.dart';

class NavSlideFromTop extends PageRouteBuilder {
  final Widget page;
  
  NavSlideFromTop({ this.page }) : 
    super(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return page;
    },
    transitionDuration: Duration(milliseconds: 450),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return new SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0.0, -1.0),
          end: Offset(0.0, 0.0),
        ).animate(animation),
        child: child,
      );
    }
  );
}
