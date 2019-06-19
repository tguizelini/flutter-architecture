import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/text.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  const Toolbar({Key key, this.leading, this.title, this.actions, this.color, this.elevation}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final Widget leading;
  final String title;
  final List<Widget> actions;
  final Color color;
  final double elevation;
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(
        text: title,
        color: colors.darkColor,
        title: true,
      ),
      leading: leading,
      actions: actions,
      elevation: elevation != null ? elevation : 6.0
    );
  }
}