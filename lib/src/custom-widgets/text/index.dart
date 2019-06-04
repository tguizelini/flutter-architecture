import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/dimens.dart' as dimens;
import 'package:flutter_architecture/src/values/colors.dart' as colors;

class CustomText extends StatelessWidget {
  final String text;
  final bool title;
  final bool bold;
  final bool big;
  final bool small;
  final bool white;
  final bool accent;
  final bool primary;
  final bool primaryDark;
  final Color color;
  final int maxLines;

  const CustomText({
    Key key, 
    this.title,
    this.text, 
    this.bold, 
    this.big, 
    this.small, 
    this.white, 
    this.accent, 
    this.primary, 
    this.primaryDark,
    this.color,
    this.maxLines
  }) : super(key: key);
  
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
        accent == true ? colors.accentColor : colors.primaryColor;

    return Text(
      textValue,
      maxLines: maxLines,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: fontSize,
        color: color == null ? customColor : color,
        fontWeight: isBold
      )
    );
  }
}