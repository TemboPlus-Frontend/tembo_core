import 'package:flutter/material.dart';

import 'decoration.dart';

class TemboContainer extends Container {
  TemboContainer({
    TemboBoxDecoration? decoration,
    required Widget child,
    super.alignment,
    super.padding,
    super.margin,
    super.width,
    super.height,
    super.key,
    super.constraints,
  }) : super(
          decoration: decoration,
          child: child,
        );
}
