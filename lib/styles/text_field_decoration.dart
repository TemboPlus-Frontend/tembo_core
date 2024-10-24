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
  }) : _decorationStyle = TemboTextFieldDecorationStyle.outline;

  const TemboTextFieldDecoration.filled({
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
  }) : _decorationStyle = TemboTextFieldDecorationStyle.outline;

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
    );
  }

  TemboTextFieldDecoration copyFontFamily(String? fontFamily) {
    return copyWith(
      valueStyle: valueStyle?.copyWith(fontFamily: fontFamily),
      hintStyle: hintStyle?.copyWith(fontFamily: fontFamily),
    );
  }

  InputBorder get border {
    final scheme = getTemboColorScheme();
    final consts = getTemboUIConstants();

    final defaultBorderWidth = consts.borderWidth;
    final defaultBorderRadius = consts.borderRadius;

    return hasBorder
        ? borderStyle == TemboBorderStyle.outline
            ? OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? defaultBorderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? scheme.border,
                  width: borderWidth ?? defaultBorderWidth,
                ),
              )
            : UnderlineInputBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? defaultBorderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? scheme.border,
                  width: borderWidth ?? defaultBorderWidth,
                ),
              )
        : InputBorder.none;
  }

  TextStyle? get getValueStyle {
    if (valueStyle != null) return valueStyle;

    final scheme = getTemboColorScheme();

    if (_decorationStyle == TemboTextFieldDecorationStyle.filled) {
      return valueStyle?.copyWith(color: scheme.onSurfaceContainer).bold;
    }

    return valueStyle.bold;
  }

  TextStyle? get getLabelStyle {
    if (labelStyle != null) return labelStyle;

    final scheme = getTemboColorScheme();
    return labelStyle?.copyWith(color: scheme.onSurface).withFW500;
  }

  TextStyle? get getHintStyle {
    if (hintStyle != null) return hintStyle;

    final scheme = getTemboColorScheme();

    if (_decorationStyle == TemboTextFieldDecorationStyle.filled) {
      return hintStyle?.copyWith(color: scheme.hint);
    }

    return hintStyle?.copyWith(color: scheme.hint);
  }

  InputDecoration get getInputDecoration {
    if (_decorationStyle == TemboTextFieldDecorationStyle.outline) {
      return getOutlineInputDecoration;
    }
    return getFilledInputDecoration;
  }

  InputDecoration get getFilledInputDecoration {
    final scheme = getTemboColorScheme();

    // ignore: no_leading_underscores_for_local_identifiers
    final _hintStyle = hintStyle?.copyWith(color: scheme.onSurfaceContainer);
    // ignore: no_leading_underscores_for_local_identifiers
    final _labelStyle = valueStyle?.copyWith(color: scheme.onSurfaceContainer);

    final decoration = InputDecoration(
      isDense: false,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(
          color: scheme.border,
          width: border.borderSide.width,
        ),
      ),
      focusedErrorBorder: border,
      errorBorder: border.copyWith(
        borderSide: BorderSide(
          color: scheme.error,
          width: border.borderSide.width,
        ),
      ),
      disabledBorder: border,
      filled: true,
      fillColor: fillColor ?? scheme.surfaceContainer,
      contentPadding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
      hintStyle: _hintStyle,
      hintText: hint,
      label: label == null ? null : Text(label!, style: _labelStyle),
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
    final scheme = getTemboColorScheme();

    final decoration = InputDecoration(
      isDense: false,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(
          color: scheme.primary,
          width: border.borderSide.width,
        ),
      ),
      focusedErrorBorder: border,
      errorBorder: border.copyWith(
        borderSide: BorderSide(
          color: scheme.error,
          width: border.borderSide.width,
        ),
      ),
      disabledBorder: border,
      filled: fillColor != null,
      fillColor: fillColor,
      contentPadding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
      hintStyle: hintStyle,
      hintText: hint,
      label: label == null ? null : Text(label!, style: labelStyle),
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
    final scheme = getTemboColorScheme();
    return TemboTextFieldDecoration(
      size: const Size.fromHeight(60),
      hasBorder: true,
      borderWidth: 2,
      borderStyle: TemboBorderStyle.underline,
      hintStyle: context.textTheme.titleLarge.bold.withColor(scheme.hint),
      valueStyle: context.textTheme.titleLarge.bold.copyWith(
        color: scheme.onBackground,
      ),
      hint: "TZS 0",
      borderColor: scheme.border,
      fillColor: Colors.transparent,
    );
  }

  static TemboTextFieldDecoration getDefaultFilledDeco(BuildContext context) {
    final scheme = getTemboColorScheme();

    final style = context.textTheme.bodyMedium;

    return TemboTextFieldDecoration(
      labelStyle: style.bold.withColor(scheme.onSurface),
      hintStyle: style.withColor(scheme.hint),
      valueStyle: style.withFW500.withColor(scheme.onSurfaceContainer),
      fillColor: scheme.surfaceContainer,
      borderWidth: 0,
    );
  }
}
