import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/login_bloc.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_vertical/index.dart';
import 'package:flutter_architecture/src/values/strings.dart' as strings;
import 'package:flutter_architecture/src/values/colors.dart' as colors;
import 'package:flutter_architecture/src/values/dimens.dart' as dimens;

class Tabs extends StatelessWidget {
  final LoginBloc bloc;

  Tabs({ Key key, this.bloc }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: () => bloc.setTab("associado"),
          child: StreamBuilder<String>(
            stream: bloc.tab,
            builder: (context, snapshot) {
              return Text(strings.login["tab_associado"],
                style: TextStyle(
                  fontSize: dimens.fontTextBig,
                  color: snapshot.data == 'associado' ? colors.accentColor : colors.disabledColor, 
                  fontWeight: snapshot.data == 'associado' ? FontWeight.bold : FontWeight.normal
                ));
            }
          ),
        ),
        DividerVertical(),
        GestureDetector(
          onTap: () => bloc.setTab("escritorio"),
          child: StreamBuilder<String>(
            stream: bloc.tab,
            builder: (context, snapshot) {
              return Text(strings.login["tab_escritorio"],
                style: TextStyle(
                  fontSize: dimens.fontTextBig,
                  color: snapshot.data == 'escritorio' ? colors.accentColor : colors.primaryColorDark, 
                  fontWeight: snapshot.data == 'escritorio' ? FontWeight.bold : FontWeight.normal
                ));
            }
          ),
        )
      ],
    );
  }
}
