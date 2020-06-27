import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture/core/values/colors.dart' as colors;
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;

class InputWidget extends StatefulWidget {
  final bool autofocus;
  final String value;
  final Function(dynamic) onChange;
  final String placeholder;
  final TextInputType keyboardType;
  final bool password;
  final bool dark;
  final bool multiline;
  final String errorMessage;
  final String labelText;
  final String mask;

  const InputWidget({Key key, this.autofocus, this.value, this.errorMessage, this.onChange, this.placeholder, this.keyboardType, this.password, this.dark, this.multiline, this.labelText, this.mask}) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  TextEditingController _controller;

  @override
  void didChangeDependencies() {
    _controller = new TextEditingController();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.value;
    //fix the invertion of text editing
    if (widget.value != null) 
      _controller.selection = TextSelection.collapsed(offset: widget.value.length);

    return Padding(
      padding: EdgeInsets.only(top: dimens.fieldSpace),
      child: TextField(
        controller: _controller,
        obscureText: widget.password == true ? true : false,
        onChanged: (value) {
          if (widget.onChange != null) widget.onChange(value);
        },

        maxLines: widget.multiline == true ? null : 1,
        keyboardType: widget.multiline == true ? TextInputType.multiline : widget.keyboardType,
        style: TextStyle(
            color: widget.dark == false ? colors.primaryColor: colors.primaryColorDark   //cor do texto ao digitar,
        ),
        autofocus: widget.autofocus == null ? false : true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 4),
          hintText: widget.value == null ? "Holder" : widget.value,
          labelText: widget.labelText == null ? widget.placeholder: widget.labelText,
          //errorText: widget.errorText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: widget.dark == false ? Colors.white : colors.primaryColor, //cor da borda
                width: 0.5
            ),
          ),
          hintStyle: TextStyle(
              color: Colors.transparent, //cor do placeholder com foco
              fontSize: dimens.fontInputWidget
          ),
          enabled: true,
          labelStyle: TextStyle(
              fontSize: dimens.fontInputWidget,
              color: widget.dark == false ? colors.accentColor : colors.primaryColor//cor da label
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: colors.accentColor, //cor da label quando esta com focus
                  width: 0,
              )
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: widget.dark == false ? colors.primaryColor : colors.accentColor, //cor da label quando esta com focus
                  width: 1
              )
          )
        )
  ),
    );
  }
}
