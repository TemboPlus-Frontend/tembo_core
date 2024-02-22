import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class LipaChinaColors {
  static const primary = Color(0xFF00308F);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color(0xFFF0F8FF);
  static const onPrimaryContainer = Colors.black87;

  static const secondary = Color(0xff78184A);
  static const onSecondary = Colors.white;

  static const secondaryContainer = Color(0xFFFAE6FA);
  static const onSecondaryContainer = Colors.black;

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

class DarkLipaChinaColors {
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

final lipaChinaLightTheme = lipaChinaLightFlexColorScheme.toTheme;
final lipaChinaDarkTheme = lipaChinaDarkFlexColorScheme.toTheme;

const lipaChinaLightColorScheme = TemboColorScheme.light(
  primary: LipaChinaColors.primary,
  onPrimary: LipaChinaColors.onPrimary,
  primaryContainer: LipaChinaColors.primaryContainer,
  onPrimaryContainer: LipaChinaColors.onPrimaryContainer,
  secondaryContainer: LipaChinaColors.secondaryContainer,
  onSecondaryContainer: LipaChinaColors.onSecondaryContainer,
  secondary: LipaChinaColors.secondary,
  onSecondary: LipaChinaColors.onSecondary,
  background: LipaChinaColors.background,
  onBackground: LipaChinaColors.onBackground,
  surface: LipaChinaColors.surface,
  onSurface: LipaChinaColors.onSurface,
  error: LipaChinaColors.error,
  onError: LipaChinaColors.onError,
  success: LipaChinaColors.success,
  onSuccess: LipaChinaColors.onSuccess,
  surfaceContainer: LipaChinaColors.surfaceContainer,
  onSurfaceContainer: LipaChinaColors.onSurfaceContainer,
  border: LipaChinaColors.border,
);
final lipaChinaLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: lipaChinaLightColorScheme.background,
  primary: lipaChinaLightColorScheme.primary,
  onPrimary: lipaChinaLightColorScheme.onPrimary,
  primaryContainer: lipaChinaLightColorScheme.primaryContainer,
  onPrimaryContainer: lipaChinaLightColorScheme.onPrimaryContainer,
  secondary: lipaChinaLightColorScheme.secondary,
  onSecondary: lipaChinaLightColorScheme.onSecondary,
  secondaryContainer: lipaChinaLightColorScheme.secondaryContainer,
  onSecondaryContainer: lipaChinaLightColorScheme.onSecondaryContainer,
  error: lipaChinaLightColorScheme.error,
  onError: lipaChinaLightColorScheme.onError,
  background: lipaChinaLightColorScheme.background,
  onBackground: lipaChinaLightColorScheme.onBackground,
  scaffoldBackground: lipaChinaLightColorScheme.background,
  surface: lipaChinaLightColorScheme.surface,
  onSurface: lipaChinaLightColorScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

const lipaChinaDarkColorScheme = TemboColorScheme.dark();
final lipaChinaDarkFlexColorScheme = FlexColorScheme.dark(
  fontFamily: kFontFamily,
  primary: lipaChinaDarkColorScheme.primary,
  onPrimary: lipaChinaDarkColorScheme.onPrimary,
  appBarBackground: lipaChinaDarkColorScheme.background,
  error: lipaChinaDarkColorScheme.error,
  onError: lipaChinaDarkColorScheme.onError,
  background: lipaChinaDarkColorScheme.background,
  scaffoldBackground: lipaChinaDarkColorScheme.background,
  surface: lipaChinaDarkColorScheme.surface,
  onSurface: lipaChinaDarkColorScheme.onSurface,
  onBackground: Colors.black87,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

extension LipaChinaColorSchemeExt on ColorScheme {
  Color get surfaceContainer => LipaChinaColors.surfaceContainer;
  Color get onSurfaceContainer => LipaChinaColors.onSurfaceContainer;

  Color get success => LipaChinaColors.success;
  Color get onSuccess => LipaChinaColors.onSuccess;

  Color get border => LipaChinaColors.border;
}
