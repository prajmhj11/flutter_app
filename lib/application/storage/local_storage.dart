import 'dart:convert';

import 'package:flutter_app/application/classes/auth/user.dart';
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

  static Future<bool> setUser(String key, value) {
    return _sharedPreferences.setString(key, jsonEncode(value));
  }

  static Map<String, dynamic> test() {
    return jsonDecode(_sharedPreferences.getString('user'));
  }

  static User getUser(String key) {
    Map<String, dynamic> userMap;
    final userStr = LocalStorage.getItem('user');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final User user = User.fromJson(userMap);
      print(user);
      return user;
    }
    print(userStr);

    return null;
  }

  static Future<bool> removeItem(String key) {
    return _sharedPreferences.remove(key);
  }

  static Future<bool> clearStorage() {
    return _sharedPreferences.clear();
  }
}
