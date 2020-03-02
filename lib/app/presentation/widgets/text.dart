import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;
import 'package:flutter_architecture/core/values/colors.dart' as colors;

class CustomText extends StatelessWidget {
  final String text;
  final bool title;
  final bool bold;
  final bool big;
  final bool small;
  final bool center;
  final bool white;
  final bool dark;
  final bool accent;
  final bool primary;
  final bool primaryDark;
  final Color color;
  final int maxLines;

  const CustomText({Key key, this.text, this.title, this.bold, this.big, this.small, this.center, this.white, this.dark, this.accent, this.primary, this.primaryDark, this.color, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic isBold = bold == true ? FontWeight.bold : FontWeight.normal;

    final String textValue = text ?? "";

    final double fontSize = title == true ?
          dimens.fontTextTitle 
        : 
          big == true ? 
            dimens.fontTextBig 
          :
            small == true ? dimens.fontTextSmall : dimens.fontText; 

    final Color customColor = primaryDark == true ? 
      colors.primaryColorDark
    : 
      white == true ? 
        Colors.white 
      : 
        accent == true ? colors.accentLightColor : colors.primaryColor;

    return Text(
      textValue,
      maxLines: maxLines,
      textAlign: center == true ? TextAlign.center : null,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: fontSize,
        color: color == null ? 
            dark == true ? colors.backgroundColor : customColor 
          : 
            color,
        fontWeight: isBold
      )
    );
  }
}