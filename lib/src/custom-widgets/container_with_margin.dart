import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/dimens.dart' as dimens;

class ContainerWithMargin extends StatelessWidget {
  final Widget child;
  
  const ContainerWithMargin({
    Key key, 
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: child
    );
  }
}