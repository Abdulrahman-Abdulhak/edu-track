import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:edu_track/core/core.dart';

part 'preferences.g.dart';

@Riverpod(dependencies: [])
class Preferences extends _$Preferences {
  @override
  AppPreferences? build() {
    _init().then((value) => state = value);
    return null;
  }

  Future<AppPreferences> _init() async {
    final preferences = AppPreferences();
    await preferences.init();

    return preferences;
  }
}
