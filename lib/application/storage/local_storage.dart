import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences _sharedPreferences;

  static LocalStorage _singleton = new LocalStorage._internal();

  factory LocalStorage() {
    return _singleton;
  }
  LocalStorage._internal() {
    // Init the variable
    initializeSharedPreferences();
  }

  static Future<SharedPreferences> initializeSharedPreferences() async {
    return _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setItem(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  static String getItem(String key) {
    return _sharedPreferences.getString(key);
  }

  static Future<bool> clearStorage() {
    return _sharedPreferences.clear();
  }
}
