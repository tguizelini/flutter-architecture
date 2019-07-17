import 'package:flutter_architecture/src/blocs/base/bloc_base.dart';
import 'package:flutter_architecture/src/custom_widgets/nav_bottom_bar/models/nav_bottom_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class NavBottomBloc extends BlocBase {
  //LIST OF MENU
  final _options = BehaviorSubject<List<NavBottomModel>>.seeded([
    NavBottomModel(id: "page1", icon: Icons.home),
    NavBottomModel(id: "page2", icon: Icons.gavel)
  ]);

  Observable<List<NavBottomModel>> get options => _options.stream;

  //MENU ITEM    
  final _itemActive = BehaviorSubject<NavBottomModel>.seeded(
    NavBottomModel(id: "page1", icon: Icons.home)
  );
  Observable<NavBottomModel> get itemActive => _itemActive.stream.asBroadcastStream();

  //INDEX OF ACTIVE ITEM    
  final _optionActive = BehaviorSubject<int>.seeded(0);
  Observable<int> get optionActive => _optionActive.stream.asBroadcastStream();

  void setOptionActive(int option) {
    _itemActive.add(_options.value[option]);
    _optionActive.add(option);
  }

  @override
  void dispose() {
    _options.close();
    _itemActive.close();
    _optionActive.close();

    print("NavBottomBloc dispose called");
    
    super.dispose();
  }
}