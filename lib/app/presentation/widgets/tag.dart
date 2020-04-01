import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/presentation/widgets/text.dart';
import 'package:flutter_architecture/core/values/colors.dart' as colors;

class CustomTag extends StatefulWidget {
  final String label;
  final Function onPress;
  final bool arrow;
  final bool canCheck;
  final bool initialStatus;

  const CustomTag({Key key, this.initialStatus, this.canCheck, this.label, this.onPress, this.arrow}) : super(key: key);

  @override
  _CustomTagState createState() => _CustomTagState();
}

class _CustomTagState extends State<CustomTag> {
  bool _isActive = false;

  @override
  void initState() {
    if (widget.initialStatus != null) {
      _isActive = widget.initialStatus;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double rightPadding = widget.arrow == true ? 12.0 : 22.0;

    return GestureDetector(
      onTap: () {
        final bool newIsActive = !_isActive;

        if (widget.onPress != null) widget.onPress(newIsActive);

        if (widget.canCheck == true) setState(() {
          _isActive = newIsActive;
        });
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 6,
            bottom: 6,
            left: 22,
            right: rightPadding
        ),
        margin: EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: _isActive == true ? colors.accentColor : colors.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: colors.accentColor,
              width: 1
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomText(
                text: widget.label,
                small: true,
                color: _isActive == true ? colors.backgroundColor : colors.accentColor
            ),
            if (widget.arrow == true) SizedBox(width: 8),
            if (widget.arrow == true) Icon(Icons.arrow_drop_down, color: colors.accentColor)
          ],
        ),
      ),
    );
  }
}