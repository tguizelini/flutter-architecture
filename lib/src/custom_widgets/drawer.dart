import 'package:flutter_architecture/src/blocs/drawer_bloc.dart';
import 'package:flutter_architecture/src/custom_widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/values/colors.dart' as colors;

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerBloc bloc = DrawerBloc();

    return Drawer(
      child: Container(
        color: colors.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                //USER ACCOUNT HEADER
            
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: colors.accentColor
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/4768926?s=400&v=4')
                  ),
                  accountName: CustomText(
                    dark: true,
                    bold: true,
                    text: "Tiago Teixeira Guizelini"
                  ), 
                  accountEmail: null
                ),

                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.gavel,
                    color: colors.accentColor,
                  ),
                  title: CustomText(
                    accent: true,
                    text: "Option 1",
                  )
                ),

                ListTile(
                  onTap: () => print("option2"),
                  leading: Icon(Icons.gavel),
                  title: CustomText(
                    primaryDark: true,
                    text: "Option 2",
                  )
                ),

                //LEITURA

                ListTile(
                  onTap: () => print("option3"),
                  leading: Icon(Icons.gavel),
                  title: CustomText(
                    primaryDark: true,
                    text: "Option 3",
                  )
                ),

                //VIDEOS

                ListTile(
                  onTap: () => print("option4"),
                  leading: Icon(Icons.video_library),
                  title: CustomText(
                    primaryDark: true,
                    text: "Option 4",
                  )
                ),
              ],
            ),

            // SAIR / LOGOUT
            
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                onTap: () => bloc.logout(context),
                leading: Icon(
                  Icons.exit_to_app,
                  color: colors.primaryColor,
                ),
                title: CustomText(text: "Logout")
              ),
            )
          ],
        ),
      ),
    );
  }
}