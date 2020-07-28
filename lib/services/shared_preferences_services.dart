import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static void writeString({String key, String value}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString(key, value);
  }

  static Future<String> readString({String key}) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(key) ?? "";
  }
}
