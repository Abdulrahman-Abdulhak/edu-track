import 'package:edu_track/core/core.dart';

class MainPreferences {
  // keys of stored values
  static const _userFirstTimeKey = "userFirstTime";

  // values getters and setters
  static bool getUserFirstTime(AppPreferences? preferences) {
    if (preferences == null) return false;

    final isFirstTime = preferences.getBool(_userFirstTimeKey) ?? true;
    if (isFirstTime) preferences.setBool(_userFirstTimeKey, false);

    return isFirstTime;
  }
}
