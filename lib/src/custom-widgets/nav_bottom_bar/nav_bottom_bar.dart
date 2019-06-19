import 'package:flutter_architecture/src/blocs/base/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/card_view.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;

import 'models/nav_bottom_model.dart';
import 'nav_bottom_item.dart';

class CustomNavBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).navBottomBar;

    return StreamBuilder(
      stream: bloc.optionActive,
      builder: (context, opActive) {
        return StreamBuilder(
          stream: bloc.options,
          builder: (context, list) {
            NavBottomModel active = opActive.data;
            List<Widget> widgetList = [];

            if (list.data != null) list.data.map((op) {
              NavBottomModel option = op as NavBottomModel;

              if (active.id == option.id) {
                widgetList.add(

                  NavBottomItem(
                    icon: option.icon,
                    colorIcon: Colors.white,
                    colorBackground: colors.accentColor,
                    onPress: () => bloc.setOptionActive(context, option)
                  )

                );
              } else {
                widgetList.add(

                  NavBottomItem(
                    icon: option.icon,
                    colorIcon: colors.primaryColorDark,
                    colorBackground: Colors.white,
                    onPress: () => bloc.setOptionActive(context, option)
                  )

                );
              }

            }).toList();

            return CardView(
              elevation: 1.0,
              child: Row(children: widgetList)
            );
          }
        );
      }
    );
  }
}
