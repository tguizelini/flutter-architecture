import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/text.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_architecture/src/values/colors.dart' as colors;

class Loading extends StatelessWidget {
  final bool backgroundTransparent;
  final String message;
  final Observable<bool> status;
  final Widget child;

  const Loading({
    Key key, 
    this.status, 
    this.child, 
    this.message,
    this.backgroundTransparent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: status,
      builder: (context, snapshot) {
        return Stack(
          children: <Widget>[
            child,
            _loading(snapshot.data)
          ],
        );
      }
    );
  }

  Widget _loading(bool loading) {
    return loading == true ?
      Container(
        alignment: Alignment.center,
        color: backgroundTransparent == true ? Colors.transparent : Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomText(
                text: message,
                white: backgroundTransparent == true ? false : true,
              ),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: new AlwaysStoppedAnimation<Color>(colors.accentColor),
            )
          ]
        ),
      )
    : 
      Container();
  }
}