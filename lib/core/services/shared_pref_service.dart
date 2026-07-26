import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceService {
  static late SharedPreferences _instance;

  static Future<void> initSharedPref() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await _instance.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    return _instance.getBool(key) ?? false;
  }

  static Future<void> setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static Future<String> getString(String key) async {
    return _instance.getString(key) ?? '';
  }
}
