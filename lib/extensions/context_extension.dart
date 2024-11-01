import 'package:flutter/material.dart';
import 'package:tembo_core/constants/themes/_tembo_color_scheme.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TemboColorScheme get temboColorScheme =>
      Theme.of(this).extension<TemboColorScheme>()!;

  double get viewportWidth => MediaQuery.of(this).size.width;

  double get viewportHeight => MediaQuery.of(this).size.height;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  bool get isDarkMode =>
      View.of(this).platformDispatcher.platformBrightness == Brightness.dark;
}
