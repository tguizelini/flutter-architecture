import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ContainerCorner extends StatelessWidget {
  final Widget child;
  final Color color;
  
  const ContainerCorner({
    Key key, 
    this.color,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: double.infinity),
      decoration: BoxDecoration(
        color: color,  
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
      child: child
    );
  }
}