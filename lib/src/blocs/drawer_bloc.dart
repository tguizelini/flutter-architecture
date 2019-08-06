import 'package:flutter_architecture/src/blocs/_base/bloc_base.dart';
import 'package:flutter_architecture/src/helpers/nav/nav_no_animation.dart';
import 'package:flutter_architecture/src/helpers/storage/storage_helper.dart';
import 'package:flutter_architecture/src/helpers/storage/storage_keys.dart';
import 'package:flutter_architecture/src/pages/login/login_page.dart';
import 'package:flutter/cupertino.dart';

class DrawerBloc extends BlocBase {
  void callApp(BuildContext context, String appName) {
    //do something
  }

  void logout(BuildContext context) {
    StorageHelper.set(StorageKeys.token, "");
    StorageHelper.set(StorageKeys.login, "");
    StorageHelper.set(StorageKeys.senha, "");

    Navigator.pushReplacement(context, NavNoAnimation(page: LoginPage()));
  }
}