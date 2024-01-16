import 'package:flutter_application_hello/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentAppThemeServices {
  final SharedPreferences? _sharedPreferences;

  const CurrentAppThemeServices(this._sharedPreferences);

  Future<bool> setCurrentAppTheme(bool isDarkMode) =>
      _sharedPreferences!.setBool(isDarkModeKey, isDarkMode);

  CurrentAppTheme getCurrentAppTheme() {
    final isDarkMode = _sharedPreferences!.getBool(isDarkModeKey);
    return (isDarkMode ?? false) ? CurrentAppTheme.dark : CurrentAppTheme.light;
  }

  bool getIsDarkMode() {
    final isDarkMode = _sharedPreferences!.getBool(isDarkModeKey);
    return isDarkMode ?? false;
  }
}

final currentAppThemeServicesProvider =
    Provider<CurrentAppThemeServices>((ref) {
  return CurrentAppThemeServices(ref.watch(sharedPreferencesProvider));
});
