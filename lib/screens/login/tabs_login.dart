import 'package:flutter_architecture/components/divider_vertical/index.dart';
import 'package:flutter/material.dart';

import 'package:flutter_architecture/values/strings.dart' as strings;

class TabsLogin extends StatefulWidget {
  @override
  _TabsLogin createState() => _TabsLogin();
}

class _TabsLogin extends State<TabsLogin> {
  String _selected = "associado";
  final double _fontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: () { setState(() => _selected = "associado"); },
          child: Text(strings.login["tab_associado"],
              style: TextStyle(
                  fontSize: _fontSize,
                  color: _selected == 'associado' ? Colors.redAccent : Colors.black45, 
                  fontWeight: _selected == 'associado' ? FontWeight.bold : FontWeight.normal
              )),
        ),
        DividerVertical(),
        GestureDetector(
          onTap: () { setState(() => _selected = "escritorio"); },
          child: Text(strings.login["tab_escritorio"],
              style: TextStyle(
                fontSize: _fontSize,
                color: _selected == 'escritorio' ? Colors.redAccent : Colors.black45, 
                fontWeight: _selected == 'escritorio' ? FontWeight.bold : FontWeight.normal
              )),
        )
      ],
    );
  }
}
