import 'package:flutter/material.dart';
import 'bloc_inject.dart';

class BlocProvider extends InheritedWidget {
  final BlocInject bloc = BlocInject();

  BlocProvider({Key key, child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BlocInject of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;
  }
}