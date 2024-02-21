import 'package:flutter/material.dart';

class TemboColors {
  static const primary = Color.fromRGBO(113, 45, 255, 1);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color.fromARGB(255, 159, 127, 218);
  static const onPrimaryContainer = Colors.white;

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
}

class DarkTemboColors {
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

class TemboColorScheme {
  final Color? primary,
      onPrimary,
      primaryContainer,
      onPrimaryContainer,
      secondary,
      onSecondary,
      secondaryContainer,
      onSecondaryContainer,
      border,
      background,
      onBackground,
      surface,
      onSurface,
      surfaceContainer,
      onSurfaceContainer,
      success,
      onSuccess,
      error,
      onError;

  const TemboColorScheme({
    this.primary,
    this.onPrimary,
    this.secondary,
    this.onSecondary,
    this.border,
    this.background,
    this.onBackground,
    this.surfaceContainer,
    this.onSurfaceContainer,
    this.error,
    this.onError,
    this.primaryContainer,
    this.onPrimaryContainer,
    this.surface,
    this.onSurface,
    this.success,
    this.onSuccess,
    this.secondaryContainer,
    this.onSecondaryContainer,
  });

  const TemboColorScheme.light({
    this.primary = TemboColors.primary,
    this.onPrimary = TemboColors.onPrimary,
    this.primaryContainer = TemboColors.primaryContainer,
    this.onPrimaryContainer = TemboColors.onPrimaryContainer,
    this.secondaryContainer = TemboColors.primaryContainer,
    this.onSecondaryContainer = TemboColors.onPrimaryContainer,
    this.secondary = TemboColors.secondary,
    this.onSecondary = TemboColors.onSecondary,
    this.border = TemboColors.border,
    this.background = TemboColors.background,
    this.onBackground = TemboColors.onBackground,
    this.surfaceContainer = TemboColors.surfaceContainer,
    this.onSurfaceContainer = TemboColors.onSurfaceContainer,
    this.error = TemboColors.error,
    this.onError = TemboColors.onError,
    this.surface = TemboColors.surface,
    this.onSurface = TemboColors.onSurface,
    this.success = TemboColors.success,
    this.onSuccess = TemboColors.onSuccess,
  });

  const TemboColorScheme.dark({
    this.primary = DarkTemboColors.primary,
    this.onPrimary = DarkTemboColors.onPrimary,
    this.primaryContainer = DarkTemboColors.primaryContainer,
    this.onPrimaryContainer = DarkTemboColors.onPrimaryContainer,
    this.secondaryContainer = DarkTemboColors.primaryContainer,
    this.onSecondaryContainer = DarkTemboColors.onPrimaryContainer,
    this.secondary = DarkTemboColors.secondary,
    this.onSecondary = DarkTemboColors.onSecondary,
    this.border = DarkTemboColors.border,
    this.background = DarkTemboColors.background,
    this.onBackground = DarkTemboColors.onBackground,
    this.surfaceContainer = DarkTemboColors.surfaceContainer,
    this.onSurfaceContainer = DarkTemboColors.onSurfaceContainer,
    this.error = DarkTemboColors.error,
    this.onError = DarkTemboColors.onError,
    this.surface = DarkTemboColors.surface,
    this.onSurface = DarkTemboColors.onSurface,
    this.success = DarkTemboColors.success,
    this.onSuccess = DarkTemboColors.onSuccess,
  });

  @override
  String toString() {
    return 'TemboColorScheme(primary: $primary, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, secondary: $secondary  , onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer , border: $border, background: $background, onBackground: $onBackground, surfaceContainer: $surfaceContainer, onSurfaceContainer: $onSurfaceContainer, error: $error, onError: $onError, border: $border)';
  }
}
