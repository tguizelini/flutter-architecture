import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/application/values/colors.dart' as colors;

import 'card_view.dart';
import 'text.dart';

class CustomNavBottomSheet extends StatelessWidget{
  final String buttonLeft;
  final String buttonRight;
  final Function actionButtonLeft;
  final Widget pageToCall;

  const CustomNavBottomSheet({Key key, this.buttonLeft, this.buttonRight, this.actionButtonLeft, this.pageToCall}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CardView(
          width: double.infinity,
          height: 63,
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: ()=> actionButtonLeft(context),
                child: CustomText(
                  text: buttonLeft,
                ),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> pageToCall));},
                  child: CustomText(
                      color: colors.accentColor,
                      text: buttonRight
                  )
              ),
            ) ,
          )
      ),
    );
  }
}