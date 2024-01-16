import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  bool get isSmallScreen => screenSize.width < 800;

  bool get isMediumScreen =>
      screenSize.width >= 800 && screenSize.width <= 1200;

  bool get isLargeScreen => screenSize.width > 800 && !isMediumScreen;

  bool get isPlatformDarkThemed =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;
}
