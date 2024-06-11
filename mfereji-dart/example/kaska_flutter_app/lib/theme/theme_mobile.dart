import 'package:flutter/material.dart';
//import 'package:flex_color_scheme/flex_color_scheme.dart';
//export 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:google_fonts/google_fonts.dart';
export 'package:google_fonts/google_fonts.dart';

/*
final FlexSchemeColor schemeLight = FlexSchemeColor.from(
  primary: const Color(0xFF00296B),
  secondary: const Color(0xFFFF7B00),
  brightness: Brightness.light,
);

final FlexSchemeColor schemeDark = FlexSchemeColor.from(
  primary: const Color(0xFF6B8BC3),
  secondary: const Color(0xffff7155),
  brightness: Brightness.dark,
);

const bool useScheme = true;
const bool computeDarkTheme = false;
const int toDarkLevel = 30;

//const FlexScheme scheme = FlexScheme.flutterDash;
const FlexScheme scheme = FlexScheme.espresso;
//const FlexScheme scheme = FlexScheme.rosewood;

final String? fontFamily = GoogleFonts.notoSans().fontFamily;
//final TargetPlatform _platform = defaultTargetPlatform;
*/
//########################################################################

// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
/*
var kaskaTheme = FlexThemeData.light(
  scheme: scheme,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 9,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    chipRadius: 22.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.notoSans().fontFamily,
);

var kaskaThemeDark = FlexThemeData.dark(
  scheme: scheme,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 15,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    chipRadius: 22.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.notoSans().fontFamily,
);
*/

ThemeData kaskaTheme = ThemeData(
  fontFamily: GoogleFonts.notoSans().fontFamily,
);
ThemeData kaskaThemeDark = ThemeData(
  fontFamily: GoogleFonts.notoSans().fontFamily,
);
