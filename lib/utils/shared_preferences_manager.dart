import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferences? _preferences;

  static final _instance = SharedPreferencesManager._privateConstructor();

  SharedPreferencesManager._privateConstructor();

  factory SharedPreferencesManager() {
    return _instance;
  }

  Future<void> initional() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  String? getString(String key) {
    return _preferences?.getString(key);
  }

  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }
}
