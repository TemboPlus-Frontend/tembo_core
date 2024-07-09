import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class DauColors {
  static const primary = Color(0xffFE2E00);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color(0xffffeae6);
  static const onPrimaryContainer = Colors.black;

  static const secondary = Color.fromARGB(255, 249, 213, 53);
  static const onSecondary = Colors.black;

  static const secondaryContainer = Color.fromARGB(255, 245, 241, 222);
  static const onSecondaryContainer = Color.fromARGB(255, 0, 0, 0);

  static const background = Colors.black87;
  static const onBackground = Colors.white;

  static const surfaceContainer = Color.fromARGB(255, 96, 93, 93);
  static const onSurfaceContainer = Color.fromARGB(255, 255, 255, 255);

  static const surface = Color.fromARGB(255, 37, 38, 41);
  static const onSurface = Color.fromARGB(255, 255, 255, 255);

  static const error = Color(0xff841617);
  static const onError = Colors.white;

  static const success = Color(0xff66ff66);
  static const onSuccess = Colors.black;

  static const border = Color.fromARGB(255, 221, 214, 214);
  static const hint = Colors.white;
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
  hint: DauColors.hint,
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
  Color get hint => DauColors.hint;
}
