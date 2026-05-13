import 'package:flutter/material.dart';

class AppTheme {
  // Widgets
  // Header
  static const headerHeight = 120.0;
  static const headerPadding = paddingMedium;
  static const headerButton =
      (headerHeight - headerPadding * 2 - paddingLarge * 2) * 1.4;

  // Font sized
  static const fontLarge = 24.0;
  static const fontHuge = 32.0;

  // Padding
  static const paddingTiny = 4.0;
  static const paddingSmall = 8.0;
  static const paddingMediumSmall = 12.0;
  static const paddingMedium = 16.0;
  static const paddingLarge = 24.0;
  static const paddingHuge = 32.0;

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 108, 173, 130),

    // Overrides
    primary: Color.fromARGB(255, 108, 173, 130),
  );
}
