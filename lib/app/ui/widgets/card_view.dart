import 'package:flutter/material.dart';

class CardViewWidget extends StatelessWidget {
  final Alignment alignment;
  final double width;
  final double height;
  final EdgeInsets margin;
  final double elevation;
  final Widget child;
  final Color backgroundColor;
  final bool noCorner;
  final bool autoHeight;

  const CardViewWidget({Key key, this.alignment, this.width, this.height, this.margin, this.elevation, this.backgroundColor, this.noCorner, this.autoHeight, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: autoHeight == true ? null : height == null ? 100 : height,
        width: width,
        margin: margin,
        alignment: alignment,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: noCorner == true ? BorderRadius.circular(0) : BorderRadius.circular(8),
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
