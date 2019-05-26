import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  const Toolbar({
    Key key, 
    this.actions, 
    this.leading, 
    this.title,
    this.color
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final Color color;

  final double elevation = 6;
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      actions: actions,
      backgroundColor: color,
      elevation: elevation
    );
  }
}