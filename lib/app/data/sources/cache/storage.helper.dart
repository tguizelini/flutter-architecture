import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static final String token = "TOKEN";
  static final String cookie = "COOKIE";
  static final String login = "LOGIN";
  static final String senha = "SENHA";
}

class StorageHelper {
  static SharedPreferences _prefs;

  static Future<dynamic> _getInstance() async => _prefs = await SharedPreferences.getInstance();

  static Future<String> get(String key) async {
    await _getInstance();
    return _prefs.getString(key);
  }

  static void set(String key, dynamic value) async {
    await _getInstance();
    _prefs.setString(key, value);
  }

  static void remove(String key) async {
    await _getInstance();
    _prefs.remove(key);
  }
}

