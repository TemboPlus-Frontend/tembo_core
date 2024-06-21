import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class DauColors {
  static const primary = Color(0xffE92531);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color.fromARGB(255, 250, 227, 228);
  static const onPrimaryContainer = Colors.black;

  static const secondary = Color.fromARGB(255, 249, 213, 53);
  static const onSecondary = Colors.black;

  static const secondaryContainer = Color.fromARGB(255, 245, 241, 222);
  static const onSecondaryContainer = Color.fromARGB(181, 0, 0, 0);

  static const background = Colors.white;
  static const onBackground = Colors.black87;

  static const surfaceContainer = Color.fromARGB(255, 245, 245, 245);
  static const onSurfaceContainer = Colors.black54;

  static const surface = Color(0xfff4f5f8);
  static const onSurface = Color.fromARGB(255, 93, 93, 93);

  static const error = Color(0xff841617);
  static const onError = Colors.white;

  static const success = Color(0xff006400);
  static const onSuccess = Colors.white;

  static const border = Colors.black12;
}

final dauTemboLightTheme = dauTemboLightFlexColorScheme.toTheme;

const dauTemboAppLightScheme = TemboColorScheme.light(
  primary: DauColors.primary,
  onPrimary: DauColors.onPrimary,
  primaryContainer: DauColors.primaryContainer,
  onPrimaryContainer: DauColors.onPrimaryContainer,
  secondaryContainer: DauColors.secondaryContainer,
  onSecondaryContainer: DauColors.onSecondaryContainer,
  secondary: DauColors.secondary,
  onSecondary: DauColors.onSecondary,
  background: DauColors.background,
  onBackground: DauColors.onBackground,
  surface: DauColors.surface,
  onSurface: DauColors.onSurface,
  error: DauColors.error,
  onError: DauColors.onError,
  success: DauColors.success,
  onSuccess: DauColors.onSuccess,
  surfaceContainer: DauColors.surfaceContainer,
  onSurfaceContainer: DauColors.onSurfaceContainer,
  border: DauColors.border,
);
final dauTemboLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: dauTemboAppLightScheme.background,
  primary: dauTemboAppLightScheme.primary,
  onPrimary: dauTemboAppLightScheme.onPrimary,
  primaryContainer: dauTemboAppLightScheme.primaryContainer,
  onPrimaryContainer: dauTemboAppLightScheme.onPrimaryContainer,
  secondary: dauTemboAppLightScheme.secondary,
  onSecondary: dauTemboAppLightScheme.onSecondary,
  secondaryContainer: dauTemboAppLightScheme.secondaryContainer,
  onSecondaryContainer: dauTemboAppLightScheme.onSecondaryContainer,
  error: dauTemboAppLightScheme.error,
  onError: dauTemboAppLightScheme.onError,
  background: dauTemboAppLightScheme.background,
  onBackground: dauTemboAppLightScheme.onBackground,
  scaffoldBackground: dauTemboAppLightScheme.background,
  surface: dauTemboAppLightScheme.surface,
  onSurface: dauTemboAppLightScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

extension DauColorSchemeExt on ColorScheme {
  Color get surfaceContainer => DauColors.surfaceContainer;
  Color get onSurfaceContainer => DauColors.onSurfaceContainer;

  Color get success => DauColors.success;
  Color get onSuccess => DauColors.onSuccess;

  Color get border => DauColors.border;
}
