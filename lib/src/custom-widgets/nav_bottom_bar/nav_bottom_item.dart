import 'package:flutter/material.dart';

class NavBottomItem extends StatelessWidget {
  final IconData icon;
  final Color colorIcon;
  final Color colorBackground;
  final Function onPress;

  const NavBottomItem({
    Key key, 
    this.icon,
    this.colorIcon, 
    this.colorBackground, 
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 70,
        color: colorBackground,
        child: IconButton(
          icon: Icon(icon, color: colorIcon),
          onPressed: onPress
        )
      )
    );
  }
}