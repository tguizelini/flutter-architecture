import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function onPress;
  final bool disabled;

  final double _elevation = 3;

  const Button({
    Key key, 
    this.label,
    this.onPress,
    this.disabled
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    return RaisedButton(
      color: Colors.redAccent,
      textColor: Colors.white,
      onPressed: action,
      elevation: _elevation,
      child: Text(label ?? "Label"),
    );
  }
}