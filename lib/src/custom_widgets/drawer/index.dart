import 'package:flutter_architecture/src/custom_widgets/text/index.dart';
import 'package:flutter_architecture/src/pages/login/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;
import 'package:flutter_architecture/src/values/strings.dart' as strings;

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: NetworkImage('https://cdn.massanews.com/uploads/noticias/lg-67fc0c55-10d5-434c-a50d-d3e293ff23ce.jpg')
                ),
                accountName: Text("Dudu, O Rei do Allianz"), 
                accountEmail: null
              ),

              //GERENCIADOR

              ListTile(
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(
                  Icons.gavel,
                  color: Colors.black87,
                ),
                title: CustomText(
                  big: true,
                  text: strings.drawer["gerenciador"],
                )
              ),

              //AGENDA

              ListTile(
                onTap: () => print("agenda"),
                leading: Icon(Icons.gavel),
                title: CustomText(
                  big: true,
                  primaryDark: true,
                  text: strings.drawer["agenda"],
                )
              ),

              //LEITURA

              ListTile(
                onTap: () => print("leitura"),
                leading: Icon(Icons.gavel),
                title: CustomText(
                  big: true,
                  primaryDark: true,
                  text: strings.drawer["leitura"],
                )
              ),

              //VIDEOS

              ListTile(
                onTap: () => print("aaspflix"),
                leading: Icon(Icons.video_library),
                title: CustomText(
                  big: true,
                  primaryDark: true,
                  text: strings.drawer["videos"],
                )
              ),
            ],
          ),

          // SAIR / LOGOUT
          
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              onTap: () => {
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) {
                  return LoginPage();
                }))
              },
              leading: Icon(
                Icons.exit_to_app,
                color: colors.accentColor,
              ),
              title: CustomText(
                big: true,
                accent: true,
                text: strings.drawer["sair"],
              )
            ),
          )
        ],
      ),
    );
  }
}