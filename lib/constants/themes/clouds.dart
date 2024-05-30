import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class CloudsTemboColors {
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

final cloudsTemboLightTheme = cloudsTemboLightFlexColorScheme.toTheme;

const cloudsTemboAppLightScheme = TemboColorScheme.light(
  primary: CloudsTemboColors.primary,
  onPrimary: CloudsTemboColors.onPrimary,
  primaryContainer: CloudsTemboColors.primaryContainer,
  onPrimaryContainer: CloudsTemboColors.onPrimaryContainer,
  secondaryContainer: CloudsTemboColors.secondaryContainer,
  onSecondaryContainer: CloudsTemboColors.onSecondaryContainer,
  secondary: CloudsTemboColors.secondary,
  onSecondary: CloudsTemboColors.onSecondary,
  background: CloudsTemboColors.background,
  onBackground: CloudsTemboColors.onBackground,
  surface: CloudsTemboColors.surface,
  onSurface: CloudsTemboColors.onSurface,
  error: CloudsTemboColors.error,
  onError: CloudsTemboColors.onError,
  success: CloudsTemboColors.success,
  onSuccess: CloudsTemboColors.onSuccess,
  surfaceContainer: CloudsTemboColors.surfaceContainer,
  onSurfaceContainer: CloudsTemboColors.onSurfaceContainer,
  border: CloudsTemboColors.border,
);
final cloudsTemboLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: cloudsTemboAppLightScheme.background,
  primary: cloudsTemboAppLightScheme.primary,
  onPrimary: cloudsTemboAppLightScheme.onPrimary,
  primaryContainer: cloudsTemboAppLightScheme.primaryContainer,
  onPrimaryContainer: cloudsTemboAppLightScheme.onPrimaryContainer,
  secondary: cloudsTemboAppLightScheme.secondary,
  onSecondary: cloudsTemboAppLightScheme.onSecondary,
  secondaryContainer: cloudsTemboAppLightScheme.secondaryContainer,
  onSecondaryContainer: cloudsTemboAppLightScheme.onSecondaryContainer,
  error: cloudsTemboAppLightScheme.error,
  onError: cloudsTemboAppLightScheme.onError,
  background: cloudsTemboAppLightScheme.background,
  onBackground: cloudsTemboAppLightScheme.onBackground,
  scaffoldBackground: cloudsTemboAppLightScheme.background,
  surface: cloudsTemboAppLightScheme.surface,
  onSurface: cloudsTemboAppLightScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

extension TemboAppColorSchemeExt on ColorScheme {
  Color get surfaceContainer => CloudsTemboColors.surfaceContainer;
  Color get onSurfaceContainer => CloudsTemboColors.onSurfaceContainer;

  Color get success => CloudsTemboColors.success;
  Color get onSuccess => CloudsTemboColors.onSuccess;

  Color get border => CloudsTemboColors.border;
}
