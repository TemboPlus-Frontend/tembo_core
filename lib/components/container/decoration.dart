import 'package:flutter/material.dart';

import '../../app/app.dart';

class TemboBoxDecoration extends BoxDecoration {
  final double? radius;
  final double? borderWidth;
  final Color? borderColor;

  const TemboBoxDecoration({
    this.radius,
    this.borderWidth,
    this.borderColor,
    super.color,
    super.shape,
    super.image,
  });

  @override
  BorderRadiusGeometry? get borderRadius => shape == BoxShape.circle
      ? null
      : BorderRadius.circular(
          radius ?? getUIConstants().borderRadius,
        );

  @override
  BoxBorder? get border => borderColor == null && borderWidth == null
      ? null
      : Border.all(
          color: borderColor ?? Colors.grey,
          width: borderWidth ?? getUIConstants().borderWidth,
        );
}
