import 'package:flutter/material.dart';

class AppTheme {
  // Widget sizes
  static const headerHeight = 120.0;

  // Padding
  static const paddingTiny = 4.0;
  static const paddingSmall = 8.0;
  static const paddingMediumSmall = 12.0;
  static const paddingMedium = 16.0;
  static const paddingLarge = 24.0;

  static const paddingHuge = 32.0;

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 108, 173, 130),

    // Override primary
    primary: Color.fromARGB(255, 108, 173, 130),
  );
}
