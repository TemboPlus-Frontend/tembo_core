import 'package:flutter/material.dart';

class TemboColors {
  static const primary = Color.fromARGB(255, 24, 25, 26);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color(0xff989898);
  static const onPrimaryContainer = Colors.white;

  static const secondary = Color(0xff04448B);
  static const onSecondary = Colors.white;

  static const background = Colors.white;
  static const onBackground = Colors.black87;

  static const surfaceContainer = Color(0xffE9F4FD);
  static const onSurfaceContainer = Colors.black54;

  static const surface = Color.fromARGB(255, 237, 236, 236);
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

class TemboColorScheme {
  final Color? primary,
      onPrimary,
      primaryContainer,
      onPrimaryContainer,
      secondary,
      onSecondary,
      border,
      hint,
      title,
      body,
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
    this.hint,
    this.title,
    this.body,
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
  });

  const TemboColorScheme.light({
    this.primary = TemboColors.primary,
    this.onPrimary = TemboColors.onPrimary,
    this.primaryContainer = TemboColors.primaryContainer,
    this.onPrimaryContainer = TemboColors.onPrimaryContainer,
    this.secondary = TemboColors.secondary,
    this.onSecondary = TemboColors.onSecondary,
    this.border = TemboColors.border,
    this.hint = TemboColors.hint,
    this.title = TemboColors.title,
    this.body = TemboColors.body,
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
}
