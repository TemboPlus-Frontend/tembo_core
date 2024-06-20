import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class _TemboColors {
  static const primary = Color(0xffF90081);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color.fromARGB(255, 251, 241, 246);
  static const onPrimaryContainer = Colors.black87;

  static const secondary = Colors.green;
  static const onSecondary = Colors.white;

  static const secondaryContainer = Color(0xffedf7ee);
  static const onSecondaryContainer = Colors.black;

  static const background = Colors.white;
  static const onBackground = Colors.black;

  static const surfaceContainer = Color(0xffF8F8F8);
  static const onSurfaceContainer = Colors.black54;

  static const surface = Color(0xfff0f0f0);
  static const onSurface = Color.fromARGB(255, 93, 93, 93);

  static const error = Color(0xff841617);
  static const onError = Colors.white;

  static const success = Color(0xff50C878);
  static const onSuccess = Colors.white;

  static const border = Colors.black26;
}

final temboCarsTheme = temboCarsLightFlexColorScheme.toTheme.copyWith(
  textTheme: temboCarsLightFlexColorScheme.toTheme.textTheme.apply(
    bodyColor: temboCarsLightColorScheme.onBackground,
    displayColor: temboCarsLightColorScheme.onBackground,
    fontFamily: kFontFamily
  ),
);
const temboCarsLightColorScheme = TemboColorScheme.light(
  primary: _TemboColors.primary,
  onPrimary: _TemboColors.onPrimary,
  primaryContainer: _TemboColors.primaryContainer,
  onPrimaryContainer: _TemboColors.onPrimaryContainer,
  secondaryContainer: _TemboColors.secondaryContainer,
  onSecondaryContainer: _TemboColors.onSecondaryContainer,
  secondary: _TemboColors.secondary,
  onSecondary: _TemboColors.onSecondary,
  background: _TemboColors.background,
  onBackground: _TemboColors.onBackground,
  surface: _TemboColors.surface,
  onSurface: _TemboColors.onSurface,
  error: _TemboColors.error,
  onError: _TemboColors.onError,
  success: _TemboColors.success,
  onSuccess: _TemboColors.onSuccess,
  surfaceContainer: _TemboColors.surfaceContainer,
  onSurfaceContainer: _TemboColors.onSurfaceContainer,
  border: _TemboColors.border,
);
final temboCarsLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: temboCarsLightColorScheme.background,
  primary: temboCarsLightColorScheme.primary,
  onPrimary: temboCarsLightColorScheme.onPrimary,
  primaryContainer: temboCarsLightColorScheme.primaryContainer,
  onPrimaryContainer: temboCarsLightColorScheme.onPrimaryContainer,
  secondary: temboCarsLightColorScheme.secondary,
  onSecondary: temboCarsLightColorScheme.onSecondary,
  secondaryContainer: temboCarsLightColorScheme.secondaryContainer,
  onSecondaryContainer: temboCarsLightColorScheme.onSecondaryContainer,
  error: temboCarsLightColorScheme.error,
  onError: temboCarsLightColorScheme.onError,
  background: temboCarsLightColorScheme.background,
  onBackground: temboCarsLightColorScheme.onBackground,
  scaffoldBackground: temboCarsLightColorScheme.background,
  surface: temboCarsLightColorScheme.surface,
  onSurface: temboCarsLightColorScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

extension TemboCarsColorSchemeExt on ColorScheme {
  Color get surfaceContainer => _TemboColors.surfaceContainer;
  Color get onSurfaceContainer => _TemboColors.onSurfaceContainer;

  Color get success => _TemboColors.success;
  Color get onSuccess => _TemboColors.onSuccess;

  Color get border => _TemboColors.border;
}
