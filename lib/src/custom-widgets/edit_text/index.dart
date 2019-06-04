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

  const EditText({
    Key key, 
    this.autofocus,
    this.placeholder,
    this.keyboardType,
    this.onChange,
    this.value,
    this.password
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
          autofocus: autofocus == null ? false : true,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: dimens.fontEditText, 
              color: colors.primaryColor
            ),
            labelStyle: TextStyle(
              fontSize: dimens.fontEditText, 
              color: colors.primaryColorDark
            ),
            hintText: placeholder,
            labelText: placeholder,
            errorText: snapshot.error,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: colors.primaryColorDark,
                width: 0
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colors.primaryColor,
                width: 0
              )
            )
          )
        );
      }
    );
  }
}