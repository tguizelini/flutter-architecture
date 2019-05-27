import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final bool autofocus;
  final String placeholder;
  final TextInputType keyboardType;

  const EditText({
    Key key, 
    this.autofocus,
    this.placeholder,
    this.keyboardType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      keyboardType: keyboardType,
      autofocus: autofocus == null ? false : true,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        labelText: placeholder,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1
          )
        ),
        hintText: placeholder
      )
    );
  }
}