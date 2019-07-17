import 'package:flutter/material.dart';

class DividerField extends StatelessWidget {
  final double height;
  final double width;

  const DividerField({Key key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 16,
      width: width ?? 8
    );
  }
}
