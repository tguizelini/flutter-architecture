import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/app/data/sources/storage/storage.helper.dart';
import 'package:flutter_architecture/app/presentation/pages/login/login.page.dart';
import 'package:flutter_architecture/core/device/nav/nav_no_animation.dart';

class DrawerbarController {
  void logout(BuildContext context) {
    StorageHelper.set(StorageKeys.token, "");
    StorageHelper.set(StorageKeys.login, "");
    StorageHelper.set(StorageKeys.senha, "");

    Navigator.pushReplacement(context, NavNoAnimation(page: LoginPage()));
  }
}