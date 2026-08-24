import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferencesStorage {
  LocalPreferencesStorage(this._prefs);

  final SharedPreferences _prefs;

  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);
  String? getString(String key) => _prefs.getString(key);

  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);
  bool? getBool(String key) => _prefs.getBool(key);
}
