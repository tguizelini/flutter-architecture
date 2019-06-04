import 'package:flutter_architecture/src/pages/login/index.dart';
import 'package:flutter_architecture/src/utils/navigation/nav_no_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_architecture/src/custom_widgets/nav_bottom_bar/models/nav_bottom_model.dart';

class NavBottomBloc {
  final _options = BehaviorSubject<List<NavBottomModel>>.seeded([
    NavBottomModel(id: "home", icon: Icons.home),
    NavBottomModel(id: "login", icon: Icons.gavel),
    NavBottomModel(id: "page1", icon: Icons.chrome_reader_mode),
    NavBottomModel(id: "page2", icon: Icons.description)
  ]);

  Observable<List<NavBottomModel>> get options => _options.stream;

  final _optionActive = BehaviorSubject<NavBottomModel>.seeded(
    NavBottomModel(id: "home", icon: Icons.home)
  );

  Observable<NavBottomModel> get optionActive => _optionActive.stream;

  void setOptionActive(BuildContext context, NavBottomModel option) {
    _optionActive.sink.add(option);

    switch(option.id) {
      case "home":
        Navigator.pushReplacement(context, NavNoAnimation(
          page: LoginPage()
        ));

        break; 
      case "login":
        Navigator.pushReplacement(context, NavNoAnimation(
          page: LoginPage()
        ));

        break;
      default:
        Navigator.pushReplacement(context, NavNoAnimation(
          page: LoginPage()
        ));
        
        break;
    }
  }

  void dispose() {
    _options.close();
    _optionActive.close();
  }
}