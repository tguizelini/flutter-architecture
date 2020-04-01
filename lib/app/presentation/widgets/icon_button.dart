import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final IconData icon; 
  final Color color; 
  final Function onPressed;

  const CustomIconButton({Key key, this.icon, this.color, this.onPressed}) : super(key: key);

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) widget.onPressed();
      },
      child: CircleAvatar(
        backgroundColor: widget.color ?? Colors.yellow,
        child: Icon(widget.icon ?? Icons.android, size: 30, color: Colors.white),
      ),
    );
  }
}