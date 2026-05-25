import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Sizes
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

  // Icon
  static const iconLarge = 32.0;

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
  static const productCardHeight = 460.0;
  static const productCardFavoriteIconSize = 32.0;
  static const productCardImageAR = 4 / 2;
  static const productCardElevation = 3.0;

  // Browse - Filter
  static const filterWidth = 260.0;

  // Cart
  static const cartWidth = 600.0;
  static const cartCardHeight = 150.0;

  // Add to Cart
  static const addToCartAmountWidth = 80.0;
  static const addToCartButtonHeight = productCardHeight / 10;

  // Profile menu
  static const profileMenuWidth = 300.0;

  // Profile - Picture
  static const profilePictureSize = 70.0;

  // Global
  static const edgePadding = paddingMedium;
  static const containerPadding = paddingMedium;
  static const contentMaxWidth = 960.0;

  // Fonts
  static TextStyle textSmall({Color? color}) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle textMediumSerif({Color? color}) => GoogleFonts.ptSerif(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle textMediumThick({Color? color}) => GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: color,
  );
  static TextStyle textMediumThin({Color? color}) => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: color,
  );
  static TextStyle textMediumNormal({Color? color}) => GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: color,
  );

  static TextStyle textLargeNormal({Color? color}) => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle textLargeThick({Color? color}) => GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: color,
  );

  static TextStyle textHuge({Color? color}) => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle textGiant({Color? color}) => GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle textTitle({Color? color}) => GoogleFonts.inter(
    fontSize: 96,
    fontWeight: FontWeight.w500,
    color: color,
  );

  static TextStyle textGiantThick({Color? color}) => GoogleFonts.roboto(
    fontSize: 48,

    fontWeight: FontWeight.w700,
    color: color,
  );

  static TextStyle textLogo({Color? color}) => GoogleFonts.roboto(
    fontSize: 70,
    fontWeight: FontWeight.w700,
    color: color,
  );

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 45, 106, 79),
    brightness: Brightness.light,

    primary: Color.fromARGB(255, 45, 106, 79),
    onPrimary: Color.fromARGB(255, 255, 253, 253),

    secondary: Color.fromARGB(255, 71, 125, 100),
    onSecondary: Color.fromARGB(255, 255, 253, 253),

    tertiary: Color.fromARGB(255, 83, 183, 136),
    onTertiary: Color.fromARGB(255, 255, 253, 253),

    surface: Color.fromARGB(255, 248, 250, 248),
    onSurface: Color.fromARGB(255, 27, 46, 34),
    surfaceContainer: Color.fromARGB(255, 255, 253, 253),
    outline: Color.fromARGB(255, 224, 234, 226),

    error: Colors.redAccent,
    onError: Colors.orange,
  );
}
