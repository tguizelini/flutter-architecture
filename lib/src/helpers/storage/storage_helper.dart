import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences _prefs;

  static Future<void> _getInstance() async => _prefs = await SharedPreferences.getInstance();

  static Future<String> get(String key) async {
    await _getInstance();
    return _prefs.getString(key);
  }

  static void set(String key, dynamic value) async {
    await _getInstance();
    _prefs.setString(key, value == null ? "" : value);
  }

  static void remove(String key) async {
    _getInstance();
    _prefs.remove(key);
  }
}

