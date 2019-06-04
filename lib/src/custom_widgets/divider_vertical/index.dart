import 'package:flutter/material.dart';

class DividerVertical extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  DividerVertical({
    this.height,
    this.width,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == null ? 40 : height,
      width: width == null ? 0.5 : width,
      color: color == null ? Colors.grey : color,
    );
  }
}