import 'package:flutter/material.dart';

import '../app/app.dart';
import '../constants/themes/dau.dart';
import '../constants/themes/default.dart';
import '../constants/themes/fantuzzi.dart';
import '../constants/themes/loopcard.dart';
import '../constants/themes/ride.dart';

extension ProjectExt on Project {
  ColorScheme get colorScheme {
    return switch (this) {
      Project.dau => dauColorScheme,
      Project.ride => rideColorScheme,
      Project.loopcard => loopcardColorScheme,
      Project.fantuzzi => fantuzziColorScheme,
      _ => temboColorScheme,
    };
  }

  ThemeData get theme {
    if (this == Project.dau) return dauTheme;
    if (this == Project.ride) return rideTheme;
    if (this == Project.loopcard) return loopcardTheme;
    if (this == Project.fantuzzi) return fantuzziTheme;
    return temboTheme;
  }
}
