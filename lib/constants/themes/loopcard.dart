import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class LoopCardLightColors {
  static const primary = Colors.white;
  static const onPrimary = Colors.black;

  static const primaryContainer = Color.fromARGB(255, 242, 240, 240);
  static const onPrimaryContainer = Colors.black87;

  static const secondary = Color(0xff78184A);
  static const onSecondary = Colors.white;

  static const secondaryContainer = Color(0xFFFAE6FA);
  static const onSecondaryContainer = Colors.black;

  static const surface = Color(0xFF00308F);
  static const onSurface = Colors.white;

  static const surfaceContainer = Color(0xffd2e5f1);
  static const onSurfaceContainer = Colors.black;

  static const error = Color(0xff841617);
  static const onError = Colors.white;

  static const success = Color(0xff50C878);
  static const onSuccess = Colors.white;

  static const border = Color.fromARGB(255, 237, 237, 237);
  static const hint = Color.fromARGB(255, 216, 216, 216);
}

final _theme = loopCardLightFlexColorScheme.toTheme;

final loopCardLightTheme = _theme.copyWith(
  textTheme: _theme.textTheme.apply(
    bodyColor: loopCardLightColorScheme.onSurface,
    displayColor: loopCardLightColorScheme.onSurface,
    fontFamily: kFontFamily,
  ),
  inputDecorationTheme: _theme.inputDecorationTheme.copyWith(
    labelStyle: TextStyle(
      color: LoopCardLightColors.onSurfaceContainer,
      fontWeight: FontWeight.bold,
    ),
    fillColor: LoopCardLightColors.surfaceContainer,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.zero),
      borderSide: BorderSide(width: 1.5),
    ),
  ),
);

const loopCardLightColorScheme = TemboColorScheme.light(
  primary: LoopCardLightColors.primary,
  onPrimary: LoopCardLightColors.onPrimary,
  primaryContainer: LoopCardLightColors.primaryContainer,
  onPrimaryContainer: LoopCardLightColors.onPrimaryContainer,
  secondaryContainer: LoopCardLightColors.secondaryContainer,
  onSecondaryContainer: LoopCardLightColors.onSecondaryContainer,
  secondary: LoopCardLightColors.secondary,
  onSecondary: LoopCardLightColors.onSecondary,
  background: LoopCardLightColors.surface,
  onBackground: LoopCardLightColors.onSurface,
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
  background: loopCardLightColorScheme.surface,
  onBackground: loopCardLightColorScheme.onSurface,
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

extension LoopCardColorSchemeExt on ColorScheme {
  Color get surfaceContainer => LoopCardLightColors.surfaceContainer;
  Color get onSurfaceContainer => LoopCardLightColors.onSurfaceContainer;

  Color get success => LoopCardLightColors.success;
  Color get onSuccess => LoopCardLightColors.onSuccess;

  Color get border => LoopCardLightColors.border;
  Color get hint => LoopCardLightColors.hint;
}
