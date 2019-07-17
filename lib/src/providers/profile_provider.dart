import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/nav_bottom_bloc.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends StatelessWidget {
  final Widget child;

  const ProfileProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (BuildContext context) => NavBottomBloc())
      ],
      child: child
    );
  }
}