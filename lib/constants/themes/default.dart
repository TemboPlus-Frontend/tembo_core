import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

final lightTheme = defaultLightFlexColorScheme.toTheme;
final darkTheme = defaultDarkFlexColorScheme.toTheme;

const defaultLightColorScheme = TemboColorScheme.light();
final defaultLightFlexColorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: defaultLightColorScheme.background,
  primary: defaultLightColorScheme.primary,
  onPrimary: defaultLightColorScheme.onPrimary,
  error: defaultLightColorScheme.error,
  onError: defaultLightColorScheme.onError,
  background: defaultLightColorScheme.background,
  scaffoldBackground: defaultLightColorScheme.background,
  surface: defaultLightColorScheme.surface,
  onSurface: defaultLightColorScheme.onSurface,
  onBackground: Colors.black,
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

extension ColorSchemeExt on ColorScheme {
  Color get surfaceContainer => TemboColors.surfaceContainer;
  Color get onSurfaceContainer => TemboColors.onSurfaceContainer;

  Color get success => TemboColors.success;
  Color get onSuccess => TemboColors.onSuccess;

  Color get border => TemboColors.border;
}
