import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'color_scheme.dart';

class FantuzziColors {
  static const primary = Color(0xffd8202a);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color(0xfffbe9ea);
  static const onPrimaryContainer = Colors.black87;

  static const secondary = Color(0xff78184A);
  static const onSecondary = Colors.white;

  static const secondaryContainer = Color(0xFFFAE6FA);
  static const onSecondaryContainer = Colors.black;

  static const background = Colors.white;
  static const onBackground = Colors.black;

  static const surfaceContainer = Color(0xffF8F8F8);
  static const onSurfaceContainer = Colors.black54;

  static const surface = Color(0xfff4f5f8);
  static const onSurface = Color.fromARGB(255, 93, 93, 93);

  static const error = Color(0xff841617);
  static const onError = Colors.white;

  static const success = Color(0xff50C878);
  static const onSuccess = Colors.white;

  static const border = Colors.black26;
  static const hint = Color.fromARGB(255, 140, 140, 140);
}

final fantuzziLightTheme = fantuzziLightFlexColorScheme.toTheme.copyWith(
  textTheme: fantuzziLightFlexColorScheme.toTheme.textTheme.apply(
    bodyColor: fantuzziLightColorScheme.onBackground,
    displayColor: fantuzziLightColorScheme.onBackground,
    fontFamily: kFontFamily,
  ),
);

const fantuzziLightColorScheme = TemboColorScheme.light(
  primary: FantuzziColors.primary,
  onPrimary: FantuzziColors.onPrimary,
  primaryContainer: FantuzziColors.primaryContainer,
  onPrimaryContainer: FantuzziColors.onPrimaryContainer,
  secondaryContainer: FantuzziColors.secondaryContainer,
  onSecondaryContainer: FantuzziColors.onSecondaryContainer,
  secondary: FantuzziColors.secondary,
  onSecondary: FantuzziColors.onSecondary,
  background: FantuzziColors.background,
  onBackground: FantuzziColors.onBackground,
  surface: FantuzziColors.surface,
  onSurface: FantuzziColors.onSurface,
  error: FantuzziColors.error,
  onError: FantuzziColors.onError,
  success: FantuzziColors.success,
  onSuccess: FantuzziColors.onSuccess,
  surfaceContainer: FantuzziColors.surfaceContainer,
  onSurfaceContainer: FantuzziColors.onSurfaceContainer,
  border: FantuzziColors.border,
  hint: FantuzziColors.hint,
);

final fantuzziLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: fantuzziLightColorScheme.background,
  primary: fantuzziLightColorScheme.primary,
  onPrimary: fantuzziLightColorScheme.onPrimary,
  primaryContainer: fantuzziLightColorScheme.primaryContainer,
  onPrimaryContainer: fantuzziLightColorScheme.onPrimaryContainer,
  secondary: fantuzziLightColorScheme.secondary,
  onSecondary: fantuzziLightColorScheme.onSecondary,
  secondaryContainer: fantuzziLightColorScheme.secondaryContainer,
  onSecondaryContainer: fantuzziLightColorScheme.onSecondaryContainer,
  error: fantuzziLightColorScheme.error,
  onError: fantuzziLightColorScheme.onError,
  background: fantuzziLightColorScheme.background,
  onBackground: fantuzziLightColorScheme.onBackground,
  scaffoldBackground: fantuzziLightColorScheme.background,
  surface: fantuzziLightColorScheme.surface,
  onSurface: fantuzziLightColorScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

extension FantuzziSchemeExt on ColorScheme {
  Color get surfaceContainer => FantuzziColors.surfaceContainer;
  Color get onSurfaceContainer => FantuzziColors.onSurfaceContainer;

  Color get success => FantuzziColors.success;
  Color get onSuccess => FantuzziColors.onSuccess;

  Color get border => FantuzziColors.border;
  Color get hint => FantuzziColors.hint;
}
