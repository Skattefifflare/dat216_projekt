import 'package:flutter/material.dart';

class AppTheme {
  // Sizes
  // Font
  static const fontMedium = 16.0;
  static const fontLarge = 24.0;
  static const fontHuge = 32.0;
  static const fontGiant = 48.0;
  static const fontTitle = 96.0;

  // Padding
  static const paddingTiny = 4.0;
  static const paddingSmall = 8.0;
  static const paddingMediumSmall = 12.0;
  static const paddingMedium = 16.0;
  static const paddingLarge = 24.0;
  static const paddingHuge = 32.0;
  static const paddingGiant = 48.0;

  // Stroke
  static const strokeTiny = 1.0;
  static const strokeSmall = 2.0;
  static const strokeMedium = 4.0;
  static const strokeLarge = 8.0;

  // Border radius
  static const radiusTiny = 2.0;
  static const radiusSmall = 4.0;
  static const radiusMedium = 8.0;
  static const radiusLarge = 16.0;

  // Header
  static const headerHeight = 120.0;
  static const headerPadding = paddingMedium;
  static const headerButton =
      (headerHeight - headerPadding * 2 - paddingLarge * 2) * 1.4;

  // Footer
  static const footerHeight = 24.0;

  // Home - Category Card
  static const categoryCardMargin = paddingSmall;
  static const categoryCardWidth = contentMaxWidth / 3 - categoryCardMargin * 2;
  static const categoryCardHeight = 200.0;
  static const categoryCardPadding = paddingMediumSmall;

  // Browse - Grid
  static const productGridExtent = 340.0;

  // Browse - Product Card
  static const productCardHeight = 420.0;
  static const productCardFavoriteIconSize = 32.0;
  static const productCardImageAR = 3 / 2;
  static const productCardButtonHeight = productCardHeight / 10;
  static const productCardElevation = 3.0;

  // Browse - Filter
  static const filterWidth = 260.0;

  // Cart
  static const cartWidth = 600.0;

  // Profile - Picture
  static const profilePictureSize = 84.0;

  // Global
  static const edgePadding = paddingMedium;
  static const containerPadding = paddingMedium;
  static const contentMaxWidth = 960.0;

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 108, 173, 130),

    // Overrides
    primary: Color.fromARGB(255, 108, 173, 130),
  );
}
