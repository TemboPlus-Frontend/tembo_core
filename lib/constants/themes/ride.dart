import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

final rideColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffF90081),
  onPrimary: Colors.white,
  primaryContainer: Color.fromARGB(255, 221, 234, 243),
  onPrimaryContainer: Colors.black87,
  secondary:  Colors.green,
  onSecondary: Colors.white,
  secondaryContainer:  Color(0xffedf7ee),
  onSecondaryContainer: Colors.black,
  error: Color(0xff841617),
  onError: Colors.white,
  surface: Color(0xfff4f5f8),
  onSurface: Color.fromARGB(255, 93, 93, 93),
  surfaceContainer: Color(0xffF8F8F8),
  onSurfaceVariant: Color.fromARGB(255, 93, 93, 93),
);

final rideTheme = ThemeData(
  useMaterial3: true,
  fontFamily: fonts.markPro,
  colorScheme: rideColorScheme,
);
