import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

final dauColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffFE2E00),
  onPrimary: Colors.white,
  primaryContainer: Color(0xffffeae6),
  onPrimaryContainer: Colors.black,
  secondary:  Color.fromARGB(255, 249, 213, 53),
  onSecondary: Colors.black,
  secondaryContainer:  Color(0xffedf7ee),
  onSecondaryContainer: Colors.black,
  error: Color(0xff841617),
  onError: Colors.white,
  surface: Color(0xfff4f5f8),
  onSurface: Color.fromARGB(255, 93, 93, 93),
  surfaceContainer: Color(0xffF8F8F8),
  onSurfaceVariant: Color.fromARGB(255, 93, 93, 93),
);

final dauTheme = ThemeData(
  useMaterial3: true,
  fontFamily: fonts.markPro,
  colorScheme: dauColorScheme,
);
