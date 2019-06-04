import 'package:flutter/material.dart';

class ContainerWithMargin extends StatelessWidget {
  final Widget content;
  final double paddingDefault = 16.0;
  
  const ContainerWithMargin({
    Key key, 
    this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingDefault),
      child: content
    );
  }
}