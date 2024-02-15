import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

final lipaChinaLightTheme = _colorScheme.toTheme;
final lipaChinaDarkTheme = _darkColorScheme.toTheme;

const _light = TemboColorScheme.light();
final _colorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: _light.background,
  primary: _light.primary,
  onPrimary: _light.onPrimary,
  error: _light.error,
  onError: _light.onError,
  background: _light.background,
  scaffoldBackground: _light.background,
  surface: _light.surface,
  onSurface: _light.onSurface,
  onBackground: Colors.black,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

const _dark = TemboColorScheme.dark();
final _darkColorScheme = FlexColorScheme.dark(
  fontFamily: kFontFamily,
  primary: _dark.primary,
  onPrimary: _dark.onPrimary,
  appBarBackground: _dark.background,
  error: _dark.error,
  onError: _dark.onError,
  background: _dark.background,
  scaffoldBackground: _dark.background,
  surface: _dark.surface,
  onSurface: _dark.onSurface,
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
  Color get surfaceContainer => TemboColors.surfaceContainer;

  Color get onSurfaceContainer => TemboColors.onSurfaceContainer;

  Color get success => TemboColors.success;

  Color get onSuccess => TemboColors.onSuccess;
}
