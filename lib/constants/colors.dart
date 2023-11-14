import 'package:flutter/material.dart';

enum TemboThemeMode {
  light,
  dark,
}

extension TemboThemeModeExt on TemboThemeMode {
  bool get isLight {
    return this == TemboThemeMode.light;
  }

  bool get isDark {
    return this == TemboThemeMode.dark;
  }
}

class LightTemboColors {
  static const primary = Color(0xff04448B);
  static const onPrimary = Colors.white;

  static const border = Colors.black45;
  static const hint = Colors.black54;
  static const title = Color(0xffAAC0CE);
  static const body = Colors.black87;

  static const background = Colors.white;
  static const onBackground = Colors.black87;

  static const surfaceContainer = Color(0xffE9F4FD);
  static const onSurfaceContainer = Colors.black54;

  static const surface = Color.fromARGB(255, 237, 236, 236);
  static const onSurface = Color.fromARGB(255, 93, 93, 93);

  static const error = Color(0xff841617);
  static const onError = Colors.white;
}

class DarkTemboColors {
  //static const primary = Color(0xffE6F5FC);
  static const primary = Colors.lightBlueAccent;
  static const onPrimary = Colors.black87;

  static const border = Colors.grey;
  static const hint = Colors.white70;
  static const title = Color(0xffAAC0CE);
  static const body = Colors.white70;

  static const background = Colors.black45;
  static const onBackground = Colors.white;

  static const surfaceContainer = Color(0xff3D3D3D);
  static const onSurfaceContainer = Colors.white;

  static const surface = Color.fromARGB(255, 237, 236, 236);
  static const onSurface = Color.fromARGB(255, 93, 93, 93);

  static const error = Colors.red;
  static const onError = Colors.white;
}

class TemboColorScheme {
  final Color? primary,
      onPrimary,
      border,
      hint,
      title,
      body,
      background,
      onBackground,
      surfaceContainer,
      onSurfaceContainer,
      error,
      onError;

  const TemboColorScheme({
    this.primary,
    this.onPrimary,
    this.border,
    this.hint,
    this.title,
    this.body,
    this.background,
    this.onBackground,
    this.surfaceContainer,
    this.onSurfaceContainer,
    this.error,
    this.onError,
  });

  const TemboColorScheme.light({
    this.primary = LightTemboColors.primary,
    this.onPrimary = LightTemboColors.onPrimary,
    this.border = LightTemboColors.border,
    this.hint = LightTemboColors.hint,
    this.title = LightTemboColors.title,
    this.body = LightTemboColors.body,
    this.background = LightTemboColors.background,
    this.onBackground = LightTemboColors.onBackground,
    this.surfaceContainer = LightTemboColors.surfaceContainer,
    this.onSurfaceContainer = LightTemboColors.onSurfaceContainer,
    this.error = LightTemboColors.error,
    this.onError = LightTemboColors.onError,
  });

  const TemboColorScheme.dark({
    this.primary = DarkTemboColors.primary,
    this.onPrimary = DarkTemboColors.onPrimary,
    this.border = DarkTemboColors.border,
    this.hint = DarkTemboColors.hint,
    this.title = DarkTemboColors.title,
    this.body = DarkTemboColors.body,
    this.background = DarkTemboColors.background,
    this.onBackground = DarkTemboColors.onBackground,
    this.surfaceContainer = DarkTemboColors.surfaceContainer,
    this.onSurfaceContainer = DarkTemboColors.onSurfaceContainer,
    this.error = DarkTemboColors.error,
    this.onError = DarkTemboColors.onError,
  });
}
