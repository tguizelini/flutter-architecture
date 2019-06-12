import 'package:flutter_architecture/src/helpers/storage_helper.dart';
import 'package:flutter_architecture/src/pages/login/index.dart';
import 'package:flutter_architecture/src/utils/navigation/nav_no_animation.dart';
import 'package:flutter_architecture/src/utils/storage_keys.dart' as StorageKeys;
import 'package:flutter/cupertino.dart';

class DrawerBloc {
  void callApp(BuildContext context, String appName) {
    //fazer link com o outro app
  }

  void logout(BuildContext context) {
    StorageHelper.set(StorageKeys.token, "");
    StorageHelper.set(StorageKeys.login, "");
    StorageHelper.set(StorageKeys.senha, "");

    Navigator.pushReplacement(context, NavNoAnimation(page: LoginPage()));
  }
}