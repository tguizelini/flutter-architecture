import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/values/colors.dart' as colors;
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;

import 'modal.dart';
import 'text.dart';

class DropdownWidget extends StatelessWidget {
  final BuildContext context;
  final String value;
  final Function onChoose;
  final String label;
  final List<String> items;

  const DropdownWidget({Key key, @required this.context, this.value, this.onChoose, this.label, this.items}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    
    List<Widget> options = [];

    if (value != null) _controller.text = value;

    if (items != null) 
      items.map((i) {
        options.add(
          ListTile(
            onTap: () {
             _controller.text = i; 
             if (onChoose != null) onChoose(i);
             Navigator.pop(context);
            },
            //status: _controller.text == i ? true : false,
            title: TextWidget(text: i),
          )
        );
      }).toList();

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: TextField(
        controller: _controller,
        onChanged: (value) => null,
        enableInteractiveSelection: false,
        cursorColor: Colors.white,
        onTap: () {
          ModalWidget.show(
            context,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextWidget(text: label == null ? "" : label.toUpperCase(), bold: true, accent: true,),
                SizedBox(height: 10),
                ...options
              ]
            )
          );
        },
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        textCapitalization: TextCapitalization.none,
        style: TextStyle(color: colors.primaryColorDark), //cor do texto ao digitar,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.arrow_drop_down),
          //errorText: snapshot.error,
          //hintText: placeholder,
          labelText: label ?? "",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colors.primaryColorDark, //cor da borda
              width: 0.0
            ),
          ),
          hintStyle: TextStyle(
            color:Colors.transparent, //cor do placeholder com foco
            fontSize: dimens.fontInputWidget
          ),
          enabled: true,
          labelStyle: TextStyle(
            fontSize: dimens.fontInputWidget, 
            color: colors.primaryColorDark //cor da label
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colors.primaryColorDark, //cor da label quando esta com focus
              width: 0
            )
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: colors.primaryColorDark, //cor da label quando esta com focus
              width: 1
            )
          )
        )
      ),
    );
  }
}
