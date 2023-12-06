import 'package:flutter/material.dart';

class TemboColors {
  static const primary = Color(0xff04448B);
  static const onPrimary = Colors.white;

  static const primaryContainer = Color.fromARGB(255, 178, 207, 240);
  static const onPrimaryContainer = Color.fromARGB(255, 73, 74, 74);

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

class TemboColorScheme {
  final Color? primary,
      onPrimary,
      primaryContainer,
      onPrimaryContainer,
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
    this.primaryContainer,
    this.onPrimaryContainer,
    this.surface,
    this.onSurface,
  });

  const TemboColorScheme.light({
    this.primary = TemboColors.primary,
    this.onPrimary = TemboColors.onPrimary,
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
    this.primaryContainer = TemboColors.primaryContainer,
    this.onPrimaryContainer = TemboColors.onPrimaryContainer,
    this.surface = TemboColors.surface,
    this.onSurface = TemboColors.onSurface,
  });
}
