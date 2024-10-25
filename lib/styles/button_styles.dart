import 'package:flutter/material.dart';

import 'package:tembo_core/extensions/context_extension.dart';
import '../app/app.dart';
import '../constants/constants.dart';

enum _ButtonStyle { filled, outline, transparent }

class TemboButtonStyle {
  final Color? backgroundColor, borderColor, foregroundColor;
  final double? elevation, width, height, borderWidth, borderRadius;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool? useContinuousBorder;

  final ImageProvider? imageProvider;

  final _ButtonStyle? _style;

  const TemboButtonStyle({
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
    this.borderWidth,
    this.borderRadius,
    this.elevation,
    this.width,
    this.padding,
    this.height,
    this.textStyle,
    this.useContinuousBorder = false,
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
    this.padding,
    this.textStyle,
    this.imageProvider,
    this.useContinuousBorder = false,
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
    this.padding,
    this.textStyle,
  })  : _style = _ButtonStyle.outline,
        useContinuousBorder = false,
        elevation = 0,
        backgroundColor = Colors.transparent,
        imageProvider = null;

  const TemboButtonStyle.transparent({
    this.foregroundColor,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
  })  : _style = _ButtonStyle.transparent,
        borderRadius = kBorderRadius4,
        useContinuousBorder = false,
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
      useContinuousBorder: useContinuousBorder ?? this.useContinuousBorder,
      imageProvider: imageProvider,
    );
  }

  TemboButtonStyle merge(TemboButtonStyle other) {
    return TemboButtonStyle(
      backgroundColor: other.backgroundColor ?? backgroundColor,
      elevation: other.elevation ?? elevation,
      width: other.width ?? width,
      height: other.height ?? height,
      borderRadius: other.borderRadius ?? borderRadius,
      foregroundColor: other.foregroundColor ?? foregroundColor,
      borderColor: other.borderColor ?? borderColor,
      borderWidth: other.borderWidth ?? borderWidth,
      padding: other.padding ?? padding,
      // textStyle: other.textStyle ?? textStyle,
      useContinuousBorder: other.useContinuousBorder ?? useContinuousBorder,
      imageProvider: imageProvider,
    );
  }

  TemboButtonStyle applyDefaultThemes(BuildContext context) {
    final scheme = context.colorScheme;
    return TemboButtonStyle(
      backgroundColor: backgroundColor ??
          (_style == _ButtonStyle.filled ? scheme.primary : null),
      foregroundColor: foregroundColor ??
          (_style == _ButtonStyle.filled ? scheme.onPrimary : scheme.primary),
      borderColor: borderColor ??
          (_style == _ButtonStyle.outline ? scheme.primary : null),
      elevation: elevation,
      width: width,
      height: height,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      padding: padding,
      textStyle: textStyle,
      useContinuousBorder: useContinuousBorder,
      imageProvider: imageProvider,
    );
  }

  TemboButtonStyle mergeWithColors({
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
  }) {
    return TemboButtonStyle(
      backgroundColor: this.backgroundColor ?? backgroundColor,
      foregroundColor: this.foregroundColor ?? foregroundColor,
      borderColor: this.borderColor ?? borderColor,

      elevation: elevation,
      width: width,
      height: height,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      padding: padding,
      // textStyle: other.textStyle ?? textStyle,
      useContinuousBorder: useContinuousBorder,
      imageProvider: imageProvider,
    );
  }

  bool get _usesContinuousBorder =>
      useContinuousBorder == null || useContinuousBorder == true;

  ButtonStyle get buttonStyle {
    final ui = getUIConstants();
    final defBorderRadius = ui.borderRadius;
    final defBorderWidth = ui.borderWidth;

    final colors = getColorScheme();

    return ElevatedButton.styleFrom(
      elevation: elevation?.toDouble() ?? 0,
      backgroundColor: backgroundColor,
      shape: _usesContinuousBorder
          ? ContinuousRectangleBorder(
              borderRadius:
                  BorderRadius.circular(borderRadius ?? defBorderRadius),
              side: BorderSide(
                color: borderColor ?? colors.onInverseSurface,
                width: borderWidth ?? defBorderWidth,
              ),
            )
          : RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(borderRadius ?? defBorderRadius),
              side: BorderSide(
                color: borderColor ?? colors.onInverseSurface,
                width: borderWidth ?? defBorderRadius,
              ),
            ),
      textStyle: getTextStyle,
      fixedSize: _size,
      padding: _size == null && padding == null
          ? horizontal() + vertical(8)
          : padding,
    );
  }

  @override
  String toString() {
    return 'TemboButtonStyle(foregroundColor: $foregroundColor, backgroundColor: $backgroundColor, borderRadius: $borderRadius, padding: $padding, textStyle: $textStyle, useContinuousBorder: $useContinuousBorder, _style: $_style)';
  }
}
