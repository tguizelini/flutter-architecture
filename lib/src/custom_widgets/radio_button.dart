import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;
import 'package:flutter_architecture/src/custom_widgets/divider_field.dart';
import 'text.dart';

class RadioButton extends StatelessWidget {
  final bool status;
  final String label;
  final Function onPress;

  const RadioButton({Key key, this.status, this.label, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress != null ? onPress : () => print("radio clicked"),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //RADIO BUTTON
                Stack(
                  children: <Widget>[
                    //BOLINHA
                    Container(
                      width: 20,
                      height: 20,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: status == true ? colors.accentColor : colors.primaryColorDark,
                          width: 2
                        ),
                      ),
                    ),

                    //BOLINHA PREENCHIDA
                    if (status == true)
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: colors.accentColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                  ],
                ),

                //LABEL
                DividerField(width: 12),
                CustomText(text: label ?? "Label"),
              ]
            ),
            DividerField(height: 8,)
          ],
        ),
      ),
    );
  }
}
/*
Radio(
  groupValue: null,
  value: false, 
  onChanged: (bool value) => onPress == null ? null : onPress(value)
),
*/