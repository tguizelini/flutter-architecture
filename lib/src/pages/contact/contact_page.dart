import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom_widgets/column_scroll_view.dart';
import 'package:flutter_architecture/src/custom_widgets/toolbar.dart';
import 'package:flutter_architecture/src/pages/contact/contact_widget.dart';

class ContactPage extends StatelessWidget with ContactWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: "Contact"),

      body: Center(
        child: ColumnScrollView(
          margin: true,
          items: <Widget>[
            header(context),
            form(context)
          ],
        ),
      )
    );
  }
}