import 'package:flutter/material.dart';
import 'package:tembo_core/constants/themes/_tembo_color_scheme.dart';
import 'package:tembo_core/tembo_core.dart';

// final loopcardColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xffF3F3E0),
//   onPrimary: Colors.black,
//   primaryContainer: Color.fromARGB(255, 242, 240, 240),
//   onPrimaryContainer: Colors.black87,
//   secondary: Color(0xFFFAE6FA),
//   onSecondary: Colors.black,
//   error: Colors.orangeAccent,
//   onError: Colors.black,
//   surface: Color(0xFF00308F),
//   onSurface: Colors.white,
//   surfaceContainer: Color(0xffccd6e9),
//   onSurfaceVariant: Colors.black,
//   onInverseSurface: Colors.white70,
// );

const loopcardColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffb5c4ff),
  onPrimary: Color(0xff00287c),
  primaryContainer: Color(0xff00287c),
  onPrimaryContainer: Color(0xffaabcff),
  //
  secondary: Color(0xffbbc5f0),
  onSecondary: Color(0xff242f52),
  secondaryContainer: Color(0xff343e62),
  onSecondaryContainer: Color(0xffc9d4ff),
  //
  tertiary: Color(0xfff0b0ff),
  onTertiary: Color(0xff510b68),
  tertiaryContainer: Color(0xff510b68),
  onTertiaryContainer: Color(0xffeca4ff),
  //
  surface: Color(0xff121319),
  surfaceDim: Color(0xff121319),
  surfaceBright: Color(0xff38393f),
  surfaceContainerLowest: Color(0xff0d0e14),
  surfaceContainerLow: Color(0xff1a1b21),
  surfaceContainer: Color(0xff1e1f25),
  surfaceContainerHigh: Color(0xff282a30),
  surfaceContainerHighest: Color(0xff33343b),
  onSurface: Color(0xffe3e1ea),
  onSurfaceVariant: Color(0xffc4c5d4),
  //
  outline: Color(0xff8e909e),
  outlineVariant: Color(0xff444652),
  //
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffdad6),
  //
  inverseSurface: Color(0xffe3e1ea),
  onInverseSurface: Color(0xff2f3037),
  inversePrimary: Color(0xff3858b6),
  //
  scrim: Color(0xff000000),
  shadow: Color(0xff000000),
);

final _darkTemboColorScheme = TemboColorScheme(
  success: Color(0xffa5d395),
  onSuccess: Color(0xff11380b),
  successContainer: Color(0xff285020),
  onSuccessContainer: Color(0xffc0efb0),
);

final loopcardTheme = ThemeData(
  useMaterial3: true,
  fontFamily: fonts.markPro,
  colorScheme: loopcardColorScheme,
  cardTheme:
      CardTheme(shape: RoundedRectangleBorder(borderRadius: defBorderRadius)),
  extensions: {_darkTemboColorScheme},
);
