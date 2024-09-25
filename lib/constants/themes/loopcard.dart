import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class LoopCardLightColors {
  static const primary = Color(0xFF00308F);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color.fromARGB(255, 221, 234, 243);
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

class LoopCardDarkColors {
  static const primary = Colors.lightBlueAccent;
  static const onPrimary = Colors.black87;

  static const primaryContainer = Color.fromARGB(255, 159, 127, 218);
  static const onPrimaryContainer = Colors.white;

  static const secondary = Color(0xff5000F0);
  static const onSecondary = Colors.white;

  static const secondaryContainer = Color(0xFFFAE6FA);
  static const onSecondaryContainer = Colors.black;

  static const background = Colors.black45;
  static const onBackground = Colors.white;

  static const surfaceContainer = Color(0xff3D3D3D);
  static const onSurfaceContainer = Colors.white;

  static const surface = Color.fromARGB(255, 237, 236, 236);
  static const onSurface = Color.fromARGB(255, 93, 93, 93);

  static const success = Color(0xff006400);
  static const onSuccess = Colors.white;

  static const error = Colors.red;
  static const onError = Colors.white;

  static const border = Colors.white12;
  static const hint = Colors.white12;
}

final loopCardLightTheme = loopCardLightFlexColorScheme.toTheme.copyWith(
  textTheme: loopCardLightFlexColorScheme.toTheme.textTheme.apply(
      bodyColor: loopCardLightColorScheme.onBackground,
      displayColor: loopCardLightColorScheme.onBackground,
      fontFamily: kFontFamily),
);
final loopCardDarkTheme = loopCardDarkFlexColorScheme.toTheme;

const loopCardLightColorScheme = TemboColorScheme.light(
  primary: LoopCardLightColors.primary,
  onPrimary: LoopCardLightColors.onPrimary,
  primaryContainer: LoopCardLightColors.primaryContainer,
  onPrimaryContainer: LoopCardLightColors.onPrimaryContainer,
  secondaryContainer: LoopCardLightColors.secondaryContainer,
  onSecondaryContainer: LoopCardLightColors.onSecondaryContainer,
  secondary: LoopCardLightColors.secondary,
  onSecondary: LoopCardLightColors.onSecondary,
  background: LoopCardLightColors.background,
  onBackground: LoopCardLightColors.onBackground,
  surface: LoopCardLightColors.surface,
  onSurface: LoopCardLightColors.onSurface,
  error: LoopCardLightColors.error,
  onError: LoopCardLightColors.onError,
  success: LoopCardLightColors.success,
  onSuccess: LoopCardLightColors.onSuccess,
  surfaceContainer: LoopCardLightColors.surfaceContainer,
  onSurfaceContainer: LoopCardLightColors.onSurfaceContainer,
  border: LoopCardLightColors.border,
  hint: LoopCardLightColors.hint,
);
final loopCardLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: loopCardLightColorScheme.background,
  primary: loopCardLightColorScheme.primary,
  onPrimary: loopCardLightColorScheme.onPrimary,
  primaryContainer: loopCardLightColorScheme.primaryContainer,
  onPrimaryContainer: loopCardLightColorScheme.onPrimaryContainer,
  secondary: loopCardLightColorScheme.secondary,
  onSecondary: loopCardLightColorScheme.onSecondary,
  secondaryContainer: loopCardLightColorScheme.secondaryContainer,
  onSecondaryContainer: loopCardLightColorScheme.onSecondaryContainer,
  error: loopCardLightColorScheme.error,
  onError: loopCardLightColorScheme.onError,
  background: loopCardLightColorScheme.background,
  onBackground: loopCardLightColorScheme.onBackground,
  scaffoldBackground: loopCardLightColorScheme.background,
  surface: loopCardLightColorScheme.surface,
  onSurface: loopCardLightColorScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

const loopCardDarkColorScheme = TemboColorScheme.dark();
final loopCardDarkFlexColorScheme = FlexColorScheme.dark(
  fontFamily: kFontFamily,
  primary: loopCardDarkColorScheme.primary,
  onPrimary: loopCardDarkColorScheme.onPrimary,
  appBarBackground: loopCardDarkColorScheme.background,
  error: loopCardDarkColorScheme.error,
  onError: loopCardDarkColorScheme.onError,
  background: loopCardDarkColorScheme.background,
  scaffoldBackground: loopCardDarkColorScheme.background,
  surface: loopCardDarkColorScheme.surface,
  onSurface: loopCardDarkColorScheme.onSurface,
  onBackground: Colors.black87,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

extension LoopCardColorSchemeExt on ColorScheme {
  Color get surfaceContainer => LoopCardLightColors.surfaceContainer;
  Color get onSurfaceContainer => LoopCardLightColors.onSurfaceContainer;

  Color get success => LoopCardLightColors.success;
  Color get onSuccess => LoopCardLightColors.onSuccess;

  Color get border => LoopCardLightColors.border;
  Color get hint => LoopCardLightColors.hint;
}
