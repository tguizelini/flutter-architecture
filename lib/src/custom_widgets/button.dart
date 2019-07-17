import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;
import 'package:flutter_architecture/src/values/dimens.dart' as dimens;

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPress;
  final bool disabled;
  final bool primary;

  final double _elevation = 3;

  const CustomButton({
    Key key, 
    this.label,
    this.onPress,
    this.disabled,
    this.primary
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    return RaisedButton(
      textColor: primary == true ? colors.accentColor : colors.darkColor,
      shape: RoundedRectangleBorder(
        side: BorderSide( color: colors.accentColor ), 
        borderRadius: BorderRadius.circular(20)),
      onPressed: action,
      elevation: primary == true ? 0 : _elevation,
      color: primary == true ? Colors.transparent : null,
      child: Text(label ?? "Label", 
        style: TextStyle(fontSize: dimens.fontButton)
      ),
    );
  }
}