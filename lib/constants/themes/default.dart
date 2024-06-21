import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class DefaultTemboColors {
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
}

class DarkTemboColors {
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
}

final defaultLightTheme = defaultLightFlexColorScheme.toTheme.copyWith(
  textTheme: defaultLightFlexColorScheme.toTheme.textTheme.apply(
      bodyColor: defaultLightColorScheme.onBackground,
      displayColor: defaultLightColorScheme.onBackground,
      fontFamily: kFontFamily),
);
final defaultDarkTheme = defaultDarkFlexColorScheme.toTheme;

const defaultLightColorScheme = TemboColorScheme.light(
  primary: DefaultTemboColors.primary,
  onPrimary: DefaultTemboColors.onPrimary,
  primaryContainer: DefaultTemboColors.primaryContainer,
  onPrimaryContainer: DefaultTemboColors.onPrimaryContainer,
  secondaryContainer: DefaultTemboColors.secondaryContainer,
  onSecondaryContainer: DefaultTemboColors.onSecondaryContainer,
  secondary: DefaultTemboColors.secondary,
  onSecondary: DefaultTemboColors.onSecondary,
  background: DefaultTemboColors.background,
  onBackground: DefaultTemboColors.onBackground,
  surface: DefaultTemboColors.surface,
  onSurface: DefaultTemboColors.onSurface,
  error: DefaultTemboColors.error,
  onError: DefaultTemboColors.onError,
  success: DefaultTemboColors.success,
  onSuccess: DefaultTemboColors.onSuccess,
  surfaceContainer: DefaultTemboColors.surfaceContainer,
  onSurfaceContainer: DefaultTemboColors.onSurfaceContainer,
  border: DefaultTemboColors.border,
);
final defaultLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: defaultLightColorScheme.background,
  primary: defaultLightColorScheme.primary,
  onPrimary: defaultLightColorScheme.onPrimary,
  primaryContainer: defaultLightColorScheme.primaryContainer,
  onPrimaryContainer: defaultLightColorScheme.onPrimaryContainer,
  secondary: defaultLightColorScheme.secondary,
  onSecondary: defaultLightColorScheme.onSecondary,
  secondaryContainer: defaultLightColorScheme.secondaryContainer,
  onSecondaryContainer: defaultLightColorScheme.onSecondaryContainer,
  error: defaultLightColorScheme.error,
  onError: defaultLightColorScheme.onError,
  background: defaultLightColorScheme.background,
  onBackground: defaultLightColorScheme.onBackground,
  scaffoldBackground: defaultLightColorScheme.background,
  surface: defaultLightColorScheme.surface,
  onSurface: defaultLightColorScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

const defaultDarkColorScheme = TemboColorScheme.dark();
final defaultDarkFlexColorScheme = FlexColorScheme.dark(
  fontFamily: kFontFamily,
  primary: defaultDarkColorScheme.primary,
  onPrimary: defaultDarkColorScheme.onPrimary,
  appBarBackground: defaultDarkColorScheme.background,
  error: defaultDarkColorScheme.error,
  onError: defaultDarkColorScheme.onError,
  background: defaultDarkColorScheme.background,
  scaffoldBackground: defaultDarkColorScheme.background,
  surface: defaultDarkColorScheme.surface,
  onSurface: defaultDarkColorScheme.onSurface,
  onBackground: Colors.black87,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

extension TemboColorSchemeExt on ColorScheme {
  Color get surfaceContainer => DefaultTemboColors.surfaceContainer;
  Color get onSurfaceContainer => DefaultTemboColors.onSurfaceContainer;

  Color get success => DefaultTemboColors.success;
  Color get onSuccess => DefaultTemboColors.onSuccess;

  Color get border => DefaultTemboColors.border;
}
