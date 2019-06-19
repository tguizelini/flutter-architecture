import 'package:flutter_architecture/src/custom-widgets/nav_bottom_bar/models/nav_bottom_model.dart';
import 'package:flutter_architecture/src/pages/login/login.dart';
import 'package:flutter_architecture/src/pages/profile/page1.dart';
import 'package:flutter_architecture/src/pages/profile/page2.dart';
import 'package:flutter_architecture/src/utils/navigation/nav_no_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class NavBottomBloc {
  final _options = BehaviorSubject<List<NavBottomModel>>.seeded([
    NavBottomModel(id: "page1", icon: Icons.home),
    NavBottomModel(id: "page2", icon: Icons.gavel)
  ]);

  Observable<List<NavBottomModel>> get options => _options.stream;

  final _optionActive = BehaviorSubject<NavBottomModel>.seeded(
    NavBottomModel(id: "page1", icon: Icons.home)
  );

  Observable<NavBottomModel> get optionActive => _optionActive.stream;

  void setOptionActive(BuildContext context, NavBottomModel option) {
    _optionActive.sink.add(option);

    switch(option.id) {
      case "page1":
        Navigator.pushReplacement(context, NavNoAnimation(
          page: Page1()
        ));

        break; 
      case "page2":
        Navigator.pushReplacement(context, NavNoAnimation(
          page: Page2()
        ));

        break;
      default: 
        break;
    }
  }

  void dispose() {
    _options.close();
    _optionActive.close();
  }
}