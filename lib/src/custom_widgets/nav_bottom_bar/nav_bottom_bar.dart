import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/nav_bottom_bloc.dart';
import 'package:flutter_architecture/src/custom_widgets/card_view.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;
import 'package:provider/provider.dart';

import 'models/nav_bottom_model.dart';
import 'nav_bottom_item.dart';

class CustomNavBottom extends StatelessWidget {
  final PageController pageController;

  const CustomNavBottom({Key key, @required this.pageController}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NavBottomBloc>(context);

    return StreamBuilder(
      stream: bloc.itemActive,
      builder: (context, opActive) {

        return StreamBuilder(
          stream: bloc.options,
          builder: (context, list) {
            NavBottomModel active = opActive.data;
            List<Widget> widgetList = [];

            if (list.data != null) list.data.asMap().forEach((index, op) {
              NavBottomModel option = op as NavBottomModel;

              if (active.id == option.id) {

                widgetList.add(
                  NavBottomItem(
                    icon: option.icon,
                    colorIcon: Colors.white,
                    colorBackground: colors.accentColor,
                    onPress: () {
                      bloc.setOptionActive(index);
                      if (pageController != null) pageController.jumpToPage(index);
                    }
                  )
                );

              } else {

                widgetList.add(
                  NavBottomItem(
                    icon: option.icon,
                    colorIcon: colors.disabledColor,
                    colorBackground: Colors.white,
                    onPress: () {
                      bloc.setOptionActive(index);
                      if (pageController != null) pageController.jumpToPage(index);
                    }
                  )
                );

              }
            });

            return CardView(
              elevation: 6.0,
              child: Row(children: widgetList)
            );
          }
        );
      }
    );
  }
}
