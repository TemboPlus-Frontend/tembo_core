import 'package:flutter/material.dart';

import '../../constants/source.dart';

class TemboTableColumn {
  final Widget label;
  final num? fixedWidth;
  final Alignment alignment;
  final EdgeInsets? margin;

  double? get totalFixedWidth {
    if (fixedWidth == null) return null;

    final width = fixedWidth!.toDouble();
    if (margin != null) {
      return width + margin!.left + margin!.right;
    }
    return width;
  }

  const TemboTableColumn({
    required this.label,
    this.fixedWidth,
    this.margin,
    this.alignment = Alignment.centerLeft,
  });
}

class TemboTableRow {
  final int index;
  final List<TemboTableRowCell> cells;
  final RowDecoration decoration;
  final VoidCallback? onTap;

  const TemboTableRow({
    required this.index,
    required this.cells,
    this.decoration = const RowDecoration(),
    this.onTap,
  });
}

class TemboTableRowCell {
  final Widget child;
  final Alignment alignment;

  const TemboTableRowCell({
    required this.child,
    this.alignment = Alignment.centerLeft,
  });
}

enum RowDecorationType { bordered, zebraColored, none }

class RowDecoration {
  final RowDecorationType type;

  const RowDecoration({this.type = RowDecorationType.none});

  bool get isBordered => type == RowDecorationType.bordered;

  bool get isZebraColored => type == RowDecorationType.zebraColored;
}

class BorderedRowDecoration extends RowDecoration {
  final Color borderColor;
  final double borderWidth, borderRadius;

  const BorderedRowDecoration({
    this.borderWidth = 1.0,
    this.borderRadius = 5,
    this.borderColor = DefaultTemboColors.border,
  }) : super(type: RowDecorationType.bordered);
}

class ZebraColoredRowDecoration extends RowDecoration {
  final Color color1, color2;

  /// condition to decide which color to paint given the row index.
  /// return 1 for [color1] or 2 for [color2].
  /// if the function returns some other number, function will use [color2] by
  /// default.
  final int Function(int rowIndex) condition;

  const ZebraColoredRowDecoration({
    required this.color1,
    required this.color2,
    required this.condition,
  }) : super(type: RowDecorationType.zebraColored);
}
