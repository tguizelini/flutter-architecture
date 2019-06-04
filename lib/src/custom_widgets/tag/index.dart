import 'package:flutter_architecture/src/custom_widgets/text/index.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;
import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  final bool accent;
  final bool green;
  final String text;

  const CustomTag({
    Key key, 
    this.accent, 
    this.green, 
    this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = accent != null ? 
        colors.accentColor 
      : 
        green != null ? colors.accentLightColor : colors.primaryColor;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 3.0, left: 6.0, right: 6.0, bottom: 3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(
              small: true,
              color: color,
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}