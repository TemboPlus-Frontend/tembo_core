import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class RideColors {
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
  static const hint = Color.fromARGB(66, 56, 54, 54);
}

final temboCarsTheme = rideLightFlexColorScheme.toTheme.copyWith(
  textTheme: rideLightFlexColorScheme.toTheme.textTheme.apply(
      bodyColor: rideLightColorScheme.onBackground,
      displayColor: rideLightColorScheme.onBackground,
      fontFamily: kFontFamily),
);
const rideLightColorScheme = TemboColorScheme.light(
  primary: RideColors.primary,
  onPrimary: RideColors.onPrimary,
  primaryContainer: RideColors.primaryContainer,
  onPrimaryContainer: RideColors.onPrimaryContainer,
  secondaryContainer: RideColors.secondaryContainer,
  onSecondaryContainer: RideColors.onSecondaryContainer,
  secondary: RideColors.secondary,
  onSecondary: RideColors.onSecondary,
  background: RideColors.background,
  onBackground: RideColors.onBackground,
  surface: RideColors.surface,
  onSurface: RideColors.onSurface,
  error: RideColors.error,
  onError: RideColors.onError,
  success: RideColors.success,
  onSuccess: RideColors.onSuccess,
  surfaceContainer: RideColors.surfaceContainer,
  onSurfaceContainer: RideColors.onSurfaceContainer,
  border: RideColors.border,
  hint: RideColors.hint,
);
final rideLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: rideLightColorScheme.background,
  primary: rideLightColorScheme.primary,
  onPrimary: rideLightColorScheme.onPrimary,
  primaryContainer: rideLightColorScheme.primaryContainer,
  onPrimaryContainer: rideLightColorScheme.onPrimaryContainer,
  secondary: rideLightColorScheme.secondary,
  onSecondary: rideLightColorScheme.onSecondary,
  secondaryContainer: rideLightColorScheme.secondaryContainer,
  onSecondaryContainer: rideLightColorScheme.onSecondaryContainer,
  error: rideLightColorScheme.error,
  onError: rideLightColorScheme.onError,
  background: rideLightColorScheme.background,
  onBackground: rideLightColorScheme.onBackground,
  scaffoldBackground: rideLightColorScheme.background,
  surface: rideLightColorScheme.surface,
  onSurface: rideLightColorScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

extension RideColorSchemeExt on ColorScheme {
  Color get surfaceContainer => RideColors.surfaceContainer;
  Color get onSurfaceContainer => RideColors.onSurfaceContainer;

  Color get success => RideColors.success;
  Color get onSuccess => RideColors.onSuccess;

  Color get border => RideColors.border;
  Color get hint => RideColors.hint;
}
