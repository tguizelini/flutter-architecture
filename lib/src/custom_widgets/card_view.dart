import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final Alignment alignment;
  final double width;
  final double height;
  final EdgeInsets margin;
  final double elevation;
  final Widget child;
  final Color backgroundColor;

  const CardView({
    Key key, 
    this.alignment, 
    this.width,
    this.height,
    this.elevation,
    this.margin, 
    this.backgroundColor, 
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        alignment: alignment,
        color: backgroundColor,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: elevation == null ? 6.0 : elevation,
              )
            ]
        ),
        child: child
    );
  }
}
