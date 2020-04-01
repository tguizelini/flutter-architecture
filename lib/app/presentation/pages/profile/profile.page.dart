import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/presentation/pages/login/login.page.dart';
import 'package:flutter_architecture/app/presentation/widgets/text.dart';
import 'package:flutter_architecture/device/nav/nav_slide_from_bottom.dart';

import 'profile.widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfileWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "PROFILE EXAMPLE"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, NavSlideFromBottom(page: LoginPage()));
            },
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),

      body: Center(child: CustomText(text: "Profile Page", accent: true)),
    );
  }
}