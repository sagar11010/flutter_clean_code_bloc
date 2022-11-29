import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clean_code_structure/shared/utils/logger.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      /* _prefsInstance ??=*/ await SharedPreferences.getInstance();

  static late SharedPreferences _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static void clearPref() {
    //if (_prefsInstance != null) {
    _prefsInstance.clear();
    //  }
  }

  static String getString(String key, [String? defValue]) {
    try {
      if (_prefsInstance.getString(key) == 'null') {
        return defValue ?? '';
      }
    } catch (e) {
      Logger.prints('Pref is null');
    }
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static bool getBoolean(String key, [bool defValue = false]) {
    return _prefsInstance.getBool(key) ?? defValue;
  }

  static Future<bool> setBoolean(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static int getInt(String key, [int defValue = -1]) {
    return _prefsInstance.getInt(key) ?? defValue;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }
}
