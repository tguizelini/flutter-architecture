import 'package:flutter/material.dart';
import './text.dart';

import 'logo.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final Widget leading;
  final String title;
  final List<Widget> actions;
  final Color color;
  final double elevation;
  final bool logo;
  final bool hideBackArrow;

  const Toolbar({Key key, this.hideBackArrow, this.logo, this.leading, this.title, this.actions, this.color, this.elevation}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: hideBackArrow == true ? false : true,
      title: logo == true ?
          Center(child: Logo(header: true, small: true))
        :
          CustomText(
            text: title,
            accent: true,
            big: true,
          ),
      leading: leading,
      actions: actions,
      elevation: elevation != null ? elevation : 0.0
    );
  }
}