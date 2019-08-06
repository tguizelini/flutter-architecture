import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/nav_bottom_bloc.dart';
import 'package:flutter_architecture/src/custom_widgets/drawer.dart';
import 'package:flutter_architecture/src/custom_widgets/nav_bottom_bar/nav_bottom_bar.dart';
import 'package:flutter_architecture/src/custom_widgets/toast.dart';
import 'package:flutter_architecture/src/custom_widgets/toolbar.dart';
import 'package:flutter_architecture/src/pages/profile/page1.dart';
import 'package:flutter_architecture/src/pages/profile/page2.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  NavBottomBloc _blocNavBottom;
  PageController _pvController;

  @override
  void didChangeDependencies() {
    _pvController = PageController();
    _blocNavBottom = Provider.of<NavBottomBloc>(context);
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      
      appBar: Toolbar(
        title: "Profile Page",
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () => CustomToast.show("Notification clicked"),
            icon: Icon(Icons.notifications_none),
          )
        ],
      ),

      body: PageView(
        controller: _pvController,
        onPageChanged: (op) => _blocNavBottom.setOptionActive(op),
        children: <Widget>[
          Page1(),
          Page2()
        ],
      ),
      
      bottomNavigationBar: CustomNavBottom(pageController: _pvController),
    );
  }
}