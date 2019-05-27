import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences _prefs;

  static void _getInstance() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  static String get(String key) {
    _getInstance();
    return _prefs.getString(key);
  }

  static set(String key, dynamic value) async {
    _getInstance();
    _prefs.setString(key, value);
  }

  static remove(String key) async {
    _getInstance();
    _prefs.remove(key);
  }
}

