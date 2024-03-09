import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static Future<bool> saveString(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  static bool? getData({required String key}) {
    return sharedPreferences.getBool(key);
  }
}
