import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/base/bloc_base.dart';
import 'package:flutter_architecture/src/blocs/toolbar_bloc.dart';
import 'package:flutter_architecture/src/custom_widgets/text.dart';
import 'package:provider/provider.dart';

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
    final bloc = Provider.of<ToolbarBloc>(context);

    return StreamBuilder<int>(
      stream: bloc.toolbarElevation,
      builder: (context, toolbarElevation) {
        print(toolbarElevation.data);
        return AppBar(
          title: CustomText(
            text: title,
            accent: true,
            big: true,
          ),
          leading: leading,
          actions: actions,
          elevation: toolbarElevation.data != null ? 
              toolbarElevation.data.toDouble() 
            : 
              toolbarElevation.data == null ? 0.0 : toolbarElevation.data.toDouble()
        );
      }
    );
  }
}