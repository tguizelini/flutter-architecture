import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;

class CategoryIcon extends StatelessWidget {
  final Color color;
  final IconData icon;

  const CategoryIcon({Key key, this.color, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color != null ? color.withOpacity(0.2) : colors.disabledColor,
      child: Icon(icon, color: color != null ? color : colors.primaryColorDark),
    );
  }
}