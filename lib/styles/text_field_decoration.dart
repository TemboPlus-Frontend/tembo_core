// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:tembo_core/tembo_core.dart';

enum TemboBorderStyle { underline, outline }

enum TemboTextFieldDecorationStyle { outline, filled }

class TemboTextFieldDecoration {
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final String? hint, label;
  final double? borderWidth;
  final double? borderRadius;
  final Color? borderColor;
  final bool hasBorder;
  final Size? size;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TemboBorderStyle? borderStyle;
  final EdgeInsets? padding;

  final TemboTextFieldDecorationStyle _decorationStyle;

  const TemboTextFieldDecoration({
    this.fillColor,
    this.valueStyle,
    this.hintStyle,
    this.hint,
    this.label,
    this.labelStyle,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.hasBorder = true,
    this.size,
    this.prefixIcon,
    this.suffixIcon,
    this.borderStyle = TemboBorderStyle.outline,
    this.padding,
    TemboTextFieldDecorationStyle decorationStyle =
        TemboTextFieldDecorationStyle.outline,
  }) : _decorationStyle = decorationStyle;

  const TemboTextFieldDecoration.filled({
    this.fillColor,
    this.valueStyle,
    this.hintStyle,
    this.hint,
    this.label,
    this.labelStyle,
    this.borderRadius,
    this.size,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
  })  : hasBorder = false,
        borderWidth = 0,
        borderColor = Colors.transparent,
        borderStyle = TemboBorderStyle.outline,
        _decorationStyle = TemboTextFieldDecorationStyle.filled;

  TemboTextFieldDecoration copyWith({
    Color? fillColor,
    String? hint,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? borderColor,
    TextStyle? hintStyle,
    TextStyle? valueStyle,
  }) {
    return TemboTextFieldDecoration(
      fillColor: fillColor ?? this.fillColor,
      hint: hint ?? this.hint,
      hintStyle: hintStyle ?? this.hintStyle,
      valueStyle: valueStyle ?? this.valueStyle,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      hasBorder: hasBorder,
      size: size,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      label: label,
      labelStyle: labelStyle,
      borderStyle: borderStyle,
      padding: padding,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      decorationStyle: _decorationStyle,
    );
  }

  TemboTextFieldDecoration copyFontFamily(String? fontFamily) {
    return copyWith(
      valueStyle: valueStyle?.copyWith(fontFamily: fontFamily),
      hintStyle: hintStyle?.copyWith(fontFamily: fontFamily),
    );
  }

  InputBorder get border {
    final scheme = getColorScheme();
    final consts = getUIConstants();

    final defaultBorderWidth = consts.borderWidth;
    final defaultBorderRadius = consts.borderRadius;

    return hasBorder
        ? borderStyle == TemboBorderStyle.outline
            ? OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? defaultBorderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? scheme.onInverseSurface,
                  width: borderWidth ?? defaultBorderWidth,
                ),
              )
            : UnderlineInputBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? defaultBorderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? scheme.onInverseSurface,
                  width: borderWidth ?? defaultBorderWidth,
                ),
              )
        : InputBorder.none;
  }

  InputBorder get filledBorder {
    final consts = getUIConstants();
    final defaultBorderRadius = consts.borderRadius;

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? defaultBorderRadius),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
    );
  }

  TextStyle? get getValueStyle {
    if (valueStyle != null) return valueStyle;

    final scheme = getColorScheme();
    final textstyle = getThemeData().textTheme.bodyMedium.bold;

    if (_decorationStyle == TemboTextFieldDecorationStyle.filled) {
      return textstyle.copyWith(color: scheme.onSurfaceVariant);
    }

    return textstyle;
  }

  TextStyle? get getLabelStyle {
    if (labelStyle != null) return labelStyle;

    final scheme = getColorScheme();
    final textstyle = getThemeData().textTheme.bodyLarge.withFW500;
    return textstyle.copyWith(color: scheme.onSurface);
  }

  TextStyle? get getHintStyle {
    if (hintStyle != null) return hintStyle;

    final scheme = getColorScheme();
    final textstyle = getThemeData().textTheme.bodyMedium.withFW400;

    if (_decorationStyle == TemboTextFieldDecorationStyle.filled) {
      return textstyle.copyWith(
          color: scheme.onSurfaceVariant.withOpacity(.75));
    }

    return textstyle.copyWith(color: scheme.onSurfaceVariant);
  }

  InputDecoration get getInputDecoration {
    if (_decorationStyle == TemboTextFieldDecorationStyle.outline) {
      return getOutlineInputDecoration;
    }
    return getFilledInputDecoration;
  }

  InputDecoration get getFilledInputDecoration {
    final scheme = getColorScheme();
    final consts = getUIConstants();

    final errorBorder = filledBorder.copyWith(
      borderSide: BorderSide(
        color: scheme.error,
        width: consts.borderWidth,
      ),
    );

    final disabledBorder = filledBorder.copyWith(
      borderSide: BorderSide(
        width: consts.borderWidth,
        color: scheme.onInverseSurface.withOpacity(.7),
      ),
    );

    final decoration = InputDecoration(
      isDense: false,
      border: filledBorder,
      enabledBorder: filledBorder,
      focusedBorder: filledBorder,
      focusedErrorBorder: errorBorder,
      errorBorder: errorBorder,
      disabledBorder: disabledBorder,
      filled: true,
      fillColor: fillColor ?? scheme.surfaceContainer,
      contentPadding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
      hintStyle: getHintStyle,
      hintText: hint,
    );
    if (prefixIcon != null) {
      return decoration.copyWith(
          prefixIcon: IconTheme(
        data: IconThemeData(color: scheme.onSurface),
        child: prefixIcon!,
      ));
    }
    if (suffixIcon != null) {
      return decoration.copyWith(
          suffixIcon: IconTheme(
        data: IconThemeData(color: scheme.onSurface),
        child: suffixIcon!,
      ));
    }
    return decoration;
  }

  InputDecoration get getOutlineInputDecoration {
    final scheme = getColorScheme();
    final consts = getUIConstants();

    final errorBorder = border.copyWith(
      borderSide: BorderSide(
        color: scheme.error,
        width: consts.borderWidth,
      ),
    );

    final disabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(consts.borderRadius),
      borderSide: BorderSide(
        width: consts.borderWidth,
        color: Colors.grey,
      ),
    );

    final decoration = InputDecoration(
      isDense: false,
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      focusedErrorBorder: errorBorder,
      errorBorder: errorBorder,
      disabledBorder: disabledBorder,
      filled: fillColor != null,
      fillColor: fillColor,
      contentPadding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
      hintStyle: getHintStyle,
      hintText: hint,
    );
    if (prefixIcon != null) {
      return decoration.copyWith(
          prefixIcon: IconTheme(
        data: IconThemeData(color: scheme.onSurface),
        child: prefixIcon!,
      ));
    }
    if (suffixIcon != null) {
      return decoration.copyWith(
          suffixIcon: IconTheme(
        data: IconThemeData(color: scheme.onSurface),
        child: suffixIcon!,
      ));
    }
    return decoration;
  }

  static TemboTextFieldDecoration getDefaultAmountDeco(BuildContext context) {
    final scheme = getColorScheme();
    return TemboTextFieldDecoration(
      size: const Size.fromHeight(60),
      hasBorder: true,
      borderWidth: 2,
      borderStyle: TemboBorderStyle.underline,
      hintStyle: context.textTheme.titleLarge.bold.withColor(scheme.onSurface),
      valueStyle: context.textTheme.titleLarge.bold.copyWith(
        color: scheme.onSurface,
      ),
      hint: "TZS 0",
      borderColor: scheme.surface,
      fillColor: Colors.transparent,
    );
  }

  static TemboTextFieldDecoration getDefaultFilledDeco(BuildContext context) {
    final scheme = getColorScheme();

    final style = context.textTheme.bodyMedium;

    return TemboTextFieldDecoration(
      labelStyle: style.bold.withColor(scheme.onSurface),
      hintStyle: style.withColor(scheme.onSurfaceVariant),
      valueStyle: style.withFW500.withColor(scheme.onSurfaceVariant),
      fillColor: scheme.surfaceContainer,
      borderWidth: 0,
    );
  }

  @override
  String toString() {
    return 'TemboTextFieldDecoration(fillColor: $fillColor, hintStyle: $hintStyle, labelStyle: $labelStyle, valueStyle: $valueStyle, label: $label, borderWidth: $borderWidth, borderRadius: $borderRadius, borderColor: $borderColor, hasBorder: $hasBorder, size: $size, prefixIcon: $prefixIcon, suffixIcon: $suffixIcon, borderStyle: $borderStyle, padding: $padding, _decorationStyle: $_decorationStyle)';
  }
}
