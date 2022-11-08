import 'package:shared_preferences/shared_preferences.dart';

class StoreUtil {
  static void save<T>(String key, T value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    switch(T) {
      case String:
        preferences.setString(key, value as String);
        break;
      case int:
        preferences.setInt(key, value as int);
        break;
      case bool:
        preferences.setBool(key, value as bool);
        break;
      case double:
        preferences.setDouble(key, value as double);
        break;
    }
  }
  static Future<T> get<T>(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dynamic res;
    switch (T) {
      case String:
        res = preferences.getString(key) as T;
        break;
      case int:
        res = preferences.getInt(key) as T;
        break;
      case bool:
        res = preferences.getBool(key) as T;
        break;
      case double:
        res = preferences.getDouble(key) as T;
        break;
    }
    return res;
  }

  static Future<bool> remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(key);
  }

  static Future<bool> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }

  static Future<bool> containsKey(String key) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.containsKey(key);
  }
}