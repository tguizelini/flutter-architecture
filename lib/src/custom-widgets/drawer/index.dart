import 'package:flutter_architecture/src/blocs/base/bloc_provider.dart';
import 'package:flutter_architecture/src/custom-widgets/text/index.dart';
import 'package:flutter_architecture/src/pages/login/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;
import 'package:flutter_architecture/src/values/strings.dart' as strings;

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).login;

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              //USER ACCOUNT HEADER
          
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage( 
                    image: AssetImage("assets/images/login_associado_background.png"),
                    fit: BoxFit.cover
                  ) 
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/4768926?s=400&v=4')
                ),
                accountName: Text("Tiago Teixeira Guizelini"), 
                accountEmail: null
              ),

              ListTile(
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(
                  Icons.gavel,
                  color: Colors.black87,
                ),
                title: CustomText(
                  big: true,
                  dark: true,
                  text: strings.drawer["option1"],
                )
              ),

              ListTile(
                onTap: () => print("option2"),
                leading: Icon(Icons.gavel),
                title: CustomText(
                  big: true,
                  primaryDark: true,
                  text: strings.drawer["option2"],
                )
              ),

              //LEITURA

              ListTile(
                onTap: () => print("option3"),
                leading: Icon(Icons.gavel),
                title: CustomText(
                  big: true,
                  primaryDark: true,
                  text: strings.drawer["option3"],
                )
              ),

              //VIDEOS

              ListTile(
                onTap: () => print("option4"),
                leading: Icon(Icons.video_library),
                title: CustomText(
                  big: true,
                  primaryDark: true,
                  text: strings.drawer["option4"],
                )
              ),
            ],
          ),

          // SAIR / LOGOUT
          
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              leading: Icon(
                Icons.exit_to_app,
                color: colors.accentColor,
              ),
              title: CustomText(
                big: true,
                accent: true,
                text: strings.drawer["logout"],
              )
            ),
          )
        ],
      ),
    );
  }
}