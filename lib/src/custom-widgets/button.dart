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
      textColor: primary == true ? colors.primaryColorDark : colors.darkColor,
      onPressed: action,
      elevation: _elevation,
      color: primary == true ? Colors.transparent : null,
      child: Text(label ?? "Label", 
        style: TextStyle(fontSize: dimens.fontButton)
      ),
    );
  }
}