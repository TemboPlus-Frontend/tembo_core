import 'package:flutter/material.dart';

import '../app/app.dart';
import '../constants/constants.dart';

enum _ButtonStyle { filled, outline, transparent }

const defaultPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

class TemboButtonStyle {
  final Color? backgroundColor, borderColor, foregroundColor;
  final double? elevation, width, height, borderWidth, borderRadius;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  final ImageProvider? imageProvider;

  final _ButtonStyle? _style;

  bool get isOutline => _style == _ButtonStyle.outline;
  bool get isFilled => _style == _ButtonStyle.filled;
  bool get isTransparent => _style == _ButtonStyle.transparent;

  const TemboButtonStyle({
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
    this.borderWidth,
    this.borderRadius,
    this.elevation,
    this.width,
    this.padding = defaultPadding,
    this.height,
    this.textStyle,
    this.imageProvider,
  }) : _style = null;

  TextStyle? get getTextStyle => textStyle?.copyWith(color: foregroundColor);

  const TemboButtonStyle.filled({
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.elevation,
    this.width,
    this.height,
    this.padding = defaultPadding,
    this.textStyle,
    this.imageProvider,
  })  : _style = _ButtonStyle.filled,
        borderColor = Colors.transparent,
        borderWidth = 0;

  const TemboButtonStyle.outline({
    this.foregroundColor,
    this.borderColor,
    this.borderWidth = 1.5,
    this.borderRadius = kBorderRadius4,
    this.width,
    this.height,
    this.padding = defaultPadding,
    this.textStyle,
  })  : _style = _ButtonStyle.outline,
        elevation = 0,
        backgroundColor = Colors.transparent,
        imageProvider = null;

  const TemboButtonStyle.transparent({
    this.foregroundColor,
    this.width,
    this.height,
    this.padding = defaultPadding,
    this.textStyle,
  })  : _style = _ButtonStyle.transparent,
        borderRadius = kBorderRadius4,
        elevation = 0,
        backgroundColor = Colors.transparent,
        borderColor = Colors.transparent,
        borderWidth = 0,
        imageProvider = null;

  Size? get _size {
    if (width != null && height != null) {
      return Size(width!.toDouble(), height!.toDouble());
    }
    if (width != null && height == null) {
      return Size(width!.toDouble(), 50);
    }
    if (width == null && height != null) {
      return Size.fromHeight(height!.toDouble());
    }
    /*   if (width == null && height == null) {
      return const Size.fromHeight(50);
    } */
    return null;
  }

  TemboButtonStyle copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
    double? elevation,
    double? width,
    double? height,
    double? borderWidth,
    double? borderRadius,
    EdgeInsets? padding,
    TextStyle? textStyle,
    bool? useContinuousBorder,
  }) {
    return TemboButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      elevation: elevation ?? this.elevation,
      width: width ?? this.width,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      imageProvider: imageProvider,
    );
  }

  ButtonStyle get buttonStyle {
    final ui = getUIConstants();
    final defBorderRadius = ui.borderRadius;
    final defBorderWidth = ui.borderWidth;

    final colors = getColorScheme();

    return ElevatedButton.styleFrom(
      elevation: elevation?.toDouble() ?? 0,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? defBorderRadius),
        side: BorderSide(
          color: borderColor ?? colors.onInverseSurface,
          width: borderWidth ?? defBorderWidth,
        ),
      ),
      textStyle: getTextStyle,
      fixedSize: _size,
      padding: _size == null ? horizontal() + vertical(8) : padding,
    );
  }

  @override
  String toString() {
    return 'TemboButtonStyle(foregroundColor: $foregroundColor, backgroundColor: $backgroundColor, borderRadius: $borderRadius, padding: $padding, textStyle: $textStyle, _style: $_style)';
  }
}
