import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;
import 'package:flutter_architecture/src/values/dimens.dart' as dimens;

class EditText extends StatelessWidget {
  final bool autofocus;
  final Stream<dynamic> value;
  final Function(dynamic) onChange;
  final String placeholder;
  final TextInputType keyboardType;
  final bool password;
  final bool dark;

  const EditText({
    Key key, 
    this.autofocus,
    this.placeholder,
    this.keyboardType,
    this.onChange,
    this.value,
    this.password,
    this.dark
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<dynamic>(
      stream: value,
      builder: (context, snapshot) {
        return TextField(
          obscureText: password == true ? true : false,
          onChanged: onChange,
          keyboardType: keyboardType,
          style: TextStyle(
            color: dark == true ? colors.backgroundColor : colors.primaryColor  //cor do texto ao digitar
          ),
          autofocus: autofocus == null ? false : true,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            hintText: placeholder,
            labelText: placeholder,
            errorText: snapshot.error,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colors.primaryColorDark, //cor da borda 
                width: 0.0
              ),
            ),
            hintStyle: TextStyle(
              color: Colors.transparent, //cor do placeholder com foco
              fontSize: dimens.fontEditText
            ),
            labelStyle: TextStyle(
              fontSize: dimens.fontEditText, 
              color: dark == true ? colors.backgroundColor : colors.primaryColorDark //cor da label
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: colors.primaryColorDark, //cor da label quando esta com focus
                width: 0
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: dark == true ? colors.backgroundColor : colors.primaryColor, //cor da label quando esta com focus
                width: 0
              )
            )
          )
        );
      }
    );
  }
}