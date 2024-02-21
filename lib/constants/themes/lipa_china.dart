import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

class LipaChinaColors {
  static const primary = Color(0xFF00308F);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color(0xFFF0F8FF);
  static const onPrimaryContainer = Colors.black87;

  static const secondary = Color(0xff5000F0);
  static const onSecondary = Colors.white;

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

  static const border = Colors.black45;
  static const hint = Colors.black54;
  static const title = Color(0xffAAC0CE);
  static const body = Colors.black87;
}

class DarkLipaChinaColors {
  static const primary = Colors.lightBlueAccent;
  static const onPrimary = Colors.black87;

  static const primaryContainer = Color.fromARGB(255, 159, 127, 218);
  static const onPrimaryContainer = Colors.white;

  static const secondary = Color(0xff5000F0);
  static const onSecondary = Colors.white;

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

  static const border = Colors.grey;
  static const hint = Colors.white70;
  static const title = Color(0xffAAC0CE);
  static const body = Colors.white70;
}

final lipaChinaLightTheme = _colorScheme.toTheme;
final lipaChinaDarkTheme = _darkColorScheme.toTheme;

const lipaChinaLightColorScheme = TemboColorScheme.light(
  primary: LipaChinaColors.primary,
  primaryContainer: LipaChinaColors.primaryContainer,
);
final _colorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: lipaChinaLightColorScheme.background,
  primary: lipaChinaLightColorScheme.primary,
  onPrimary: lipaChinaLightColorScheme.onPrimary,
  error: lipaChinaLightColorScheme.error,
  onError: lipaChinaLightColorScheme.onError,
  background: lipaChinaLightColorScheme.background,
  scaffoldBackground: lipaChinaLightColorScheme.background,
  surface: lipaChinaLightColorScheme.surface,
  onSurface: lipaChinaLightColorScheme.onSurface,
  onBackground: Colors.black,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

const lipaChinaDarkColorScheme = TemboColorScheme.dark();
final _darkColorScheme = FlexColorScheme.dark(
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
}
