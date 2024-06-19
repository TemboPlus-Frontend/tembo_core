import 'package:flutter/material.dart';

class TemboColumn extends Column {
  const TemboColumn({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
  });

  const TemboColumn.caaStart({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
  }) : super(crossAxisAlignment: CrossAxisAlignment.start);
}
