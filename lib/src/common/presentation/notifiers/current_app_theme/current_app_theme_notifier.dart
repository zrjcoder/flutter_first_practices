import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_hello/src/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_app_theme_notifier.g.dart';

// dart run build_runner watch

@riverpod
class CurrentAppThemeNotifier extends _$CurrentAppThemeNotifier {
  late CurrentAppThemeServices _currentAppThemeService;

  CurrentAppThemeNotifier() : super();

  Future<void> updateCurrentAppTheme(bool isDarkMode) async {
    final success =
        await _currentAppThemeService.setCurrentAppTheme(isDarkMode);

    if (success) {
      state = AsyncValue.data(
        isDarkMode ? CurrentAppTheme.dark : CurrentAppTheme.light,
      );
    }
  }

  @override
  Future<CurrentAppTheme> build() async {
    _currentAppThemeService = ref.read(currentAppThemeServicesProvider);
    return _currentAppThemeService.getCurrentAppTheme();
  }
}

enum CurrentAppTheme {
  light(ThemeMode.light),
  dark(ThemeMode.dark);

  final ThemeMode themeMode;
  const CurrentAppTheme(this.themeMode);
}
