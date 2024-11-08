import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

import '_tembo_color_scheme.dart';

const temboLightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff002067),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff1d419f),
  onPrimaryContainer: Color(0xffdce1ff),
  //
  secondary: Color(0xff535d83),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffd1d9ff),
  onSecondaryContainer: Color(0xff374165),
  //
  tertiary: Color(0xff440059),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xff6b2981),
  onTertiaryContainer: Color(0xfffad5ff),
  //
  surface: Color(0xfffaf8ff),
  surfaceDim: Color(0xffdad9e2),
  surfaceBright: Color(0xfffaf8ff),
  surfaceContainerLowest: Color(0xffffffff),
  surfaceContainerLow: Color(0xfff4f3fb),
  surfaceContainer: Color(0xffeeedf6),
  surfaceContainerHigh: Color(0xffe8e7f0),
  surfaceContainerHighest: Color(0xffe3e1ea),
  onSurface: Color(0xff1a1b21),
  onSurfaceVariant: Color(0xff444652),
  //
  outline: Color(0xff747683),
  outlineVariant: Color(0xffc4c5d4),
  //
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  //
  inverseSurface: Color(0xff2f3037),
  onInverseSurface: Color(0xfff1f0f8),
  inversePrimary: Color(0xffb5c4ff),
  //
  scrim: Color(0xff000000),
  shadow: Color(0xff000000),
);

const temboDarkColorScheme = ColorScheme(
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

final _lightCardTheme = CardTheme(
  elevation: 0,
  color: temboLightColorScheme.surfaceContainer,
  shape: RoundedRectangleBorder(borderRadius: defBorderRadius),
);

final _darkCardTheme = CardTheme(
  elevation: 0,
  color: temboDarkColorScheme.surfaceContainer,
  shape: RoundedRectangleBorder(borderRadius: defBorderRadius),
);

final _lightTemboColorScheme = TemboColorScheme(
  success: Color(0xff406836),
  onSuccess: Color(0xffffffff),
  successContainer: Color(0xffc0efb0),
  onSuccessContainer: Color(0xff002200),
);

final _darkTemboColorScheme = TemboColorScheme(
  success: Color(0xffa5d395),
  onSuccess: Color(0xff11380b),
  successContainer: Color(0xff285020),
  onSuccessContainer: Color(0xffc0efb0),
);

final temboTheme = ThemeData(
  useMaterial3: true,
  fontFamily: fonts.markPro,
  colorScheme: temboLightColorScheme,
  cardTheme: _lightCardTheme,
  extensions: {_lightTemboColorScheme},
);

final temboDarkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: fonts.markPro,
  colorScheme: temboDarkColorScheme,
  cardTheme: _darkCardTheme,
  extensions: {_darkTemboColorScheme},
);
