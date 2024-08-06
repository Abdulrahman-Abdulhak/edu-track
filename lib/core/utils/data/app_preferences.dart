import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static var _instance = AppPreferences._internal();

  SharedPreferencesWithCache? _sharedPreferences;
  final Set<String>? allowList;

  AppPreferences._internal() : allowList = null;
  AppPreferences._allowed(this.allowList);

  factory AppPreferences([Set<String>? allowList]) {
    if (allowList != null) {
      _instance = AppPreferences._allowed(allowList);
    }

    return _instance;
  }

  bool get _didInitialize => _sharedPreferences != null;
  SharedPreferencesWithCache get _preferences => _sharedPreferences!;

  void _checkInitialized() {
    assert(_didInitialize, "You are yet to call init() method.");
  }

  Future<bool> init() async {
    if (_didInitialize) return true;

    _sharedPreferences = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(allowList: allowList),
    );

    return true;
  }

  bool containsKey(String key) {
    _checkInitialized();
    return _preferences.containsKey(key);
  }

  void setBool(String key, bool value) async {
    _checkInitialized();
    await _preferences.setBool(key, value);
  }

  void setInt(String key, int value) async {
    _checkInitialized();
    await _preferences.setInt(key, value);
  }

  void setDouble(String key, double value) async {
    _checkInitialized();
    await _preferences.setDouble(key, value);
  }

  void setString(String key, String value) async {
    _checkInitialized();
    await _preferences.setString(key, value);
  }

  void setStringList(String key, List<String> value) async {
    _checkInitialized();
    await _preferences.setStringList(key, value);
  }

  Object? get(String key) {
    _checkInitialized();
    return _preferences.get(key);
  }

  bool? getBool(String key) {
    return get(key) as bool?;
  }

  int? getInt(String key) {
    return get(key) as int?;
  }

  double? getDouble(String key) {
    return get(key) as double?;
  }

  String? getString(String key) {
    return get(key) as String?;
  }

  List<String>? getStringList(String key) {
    return get(key) as List<String>?;
  }

  void clear(String key) async {
    _checkInitialized();
    await _preferences.clear();
  }

  void reload(String key) async {
    _checkInitialized();
    await _preferences.reloadCache();
  }

  void remove(String key) async {
    _checkInitialized();
    await _preferences.remove(key);
  }
}
