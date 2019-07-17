import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/nav_bottom_bloc.dart';
import 'package:flutter_architecture/src/custom_widgets/drawer.dart';
import 'package:flutter_architecture/src/custom_widgets/nav_bottom_bar/nav_bottom_bar.dart';
import 'package:flutter_architecture/src/custom_widgets/toast.dart';
import 'package:flutter_architecture/src/custom_widgets/toolbar.dart';
import 'package:flutter_architecture/src/pages/profile/page1.dart';
import 'package:flutter_architecture/src/pages/profile/page2.dart';
import 'package:flutter_architecture/src/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ProfileProvider(child: _ProfilePage());
}

class _ProfilePage extends StatelessWidget {
  final PageController _pvController = PageController();

  @override
  Widget build(BuildContext context) {
    final blocNavBottom = Provider.of<NavBottomBloc>(context);

    return Scaffold(
      drawer: CustomDrawer(),
      
      appBar: Toolbar(
        title: "Profile Page",
        actions: <Widget>[
          IconButton(
            onPressed: () => CustomToast.show("Notification clicked"),
            icon: Icon(Icons.notifications_none),
          )
        ],
      ),

      body: PageView(
        controller: _pvController,
        onPageChanged: (op) => blocNavBottom.setOptionActive(op),
        children: <Widget>[
          Page1(),
          Page2()
        ],
      ),
      
      bottomNavigationBar: CustomNavBottom(pageController: _pvController),
    );
  }
}