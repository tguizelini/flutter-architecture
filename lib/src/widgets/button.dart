import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/widgets/text.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPress;
  final bool disabled;
  final bool transparent;
  final IconData icon;
  final bool facebook;

  final double _elevation = 3;

  const CustomButton({
    Key key, 
    this.label,
    this.onPress,
    this.disabled,
    this.transparent,
    this.icon,
    this.facebook
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    Color backgroundColor = colors.accentColor;
    Color borderColor = colors.accentColor;
    Color textColor = Colors.white;

    if (transparent == true) {
      backgroundColor = colors.backgroundColor;
      borderColor = colors.accentLightColor;
      textColor = colors.accentLightColor;
    } else {
      backgroundColor = colors.accentLightColor;
      borderColor = colors.accentLightColor;
      textColor = colors.accentColor;
    }

    if (facebook == true) {
      backgroundColor = colors.facebookColor;
      borderColor = colors.facebookColor;
      textColor = Colors.white;
    }
    
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 36.0),
        shape: RoundedRectangleBorder(
          side: BorderSide( color: borderColor ),
          borderRadius: BorderRadius.circular(10)
        ),
        onPressed: action,
        elevation: _elevation,
        color: backgroundColor,
        child: CustomText(text: label ?? "Label", small: true, color: textColor )
      ),
    );
  }
}