import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/container_with_margin.dart';
import 'package:flutter_architecture/src/custom-widgets/toolbar.dart';
import 'package:flutter_architecture/src/pages/contact/contact_form.dart';
import 'package:flutter_architecture/src/pages/contact/contact_header.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: "Contact",
      ),

      body: ContainerWithMargin(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ContactHeader(),
            ),
            Expanded(
              flex: 2,
              child: ContactForm()
            )
          ],
        ),
        
      ),
    );
  }
}