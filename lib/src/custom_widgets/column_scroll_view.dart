import 'package:flutter_architecture/src/custom_widgets/container_with_margin.dart';
import 'package:flutter/material.dart';

class ColumnScrollView extends StatelessWidget {
  final List<Widget> items;
  final bool center;
  final bool margin;

  const ColumnScrollView({Key key, this.items, this.center, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = items != null ? items : [];
    return SingleChildScrollView( child: column(list) );
  }

  Widget column(list) {
    return margin == true ?
      ContainerWithMargin(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: center == true ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: <Widget>[ ...list ]
        )
      )
    :
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: center == true ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: <Widget>[ ...list ]
      );
  }
}