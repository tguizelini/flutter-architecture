import 'package:flutter/cupertino.dart';

import 'package:flutter_architecture/src/application/device/nav/nav_no_animation.dart';
import 'package:flutter_architecture/src/application/device/storage/storage.helper.dart';
import 'package:flutter_architecture/src/application/device/storage/storage.keys.dart';
import 'package:flutter_architecture/src/presentation/pages/login/login.page.dart';

class DrawerbarController {
  void logout(BuildContext context) {
    StorageHelper.set(StorageKeys.token, "");
    StorageHelper.set(StorageKeys.login, "");
    StorageHelper.set(StorageKeys.senha, "");

    Navigator.pushReplacement(context, NavNoAnimation(page: LoginPage()));
  }
}