import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/presentation/pages/profile/profile.widget.dart';
import 'package:flutter_architecture/src/presentation/widgets/text.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfileWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: "Profile Page")),
    );
  }
}