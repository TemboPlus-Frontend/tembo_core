import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

const _defPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);

class TemboTextButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;

  final Widget child;
  final TemboButtonStyle? style;

  final bool? showLoading;

  const TemboTextButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.style,
    required this.child,
    this.showLoading,
  });

  TemboTextButton.text({
    super.key,
    required String text,
    required this.onPressed,
    this.onLongPress,
    this.style,
    this.showLoading,
  }) : child = TemboText.w500(text);

  @override
  State<TemboTextButton> createState() => _TemboTextButtonState();
}

class _TemboTextButtonState extends State<TemboTextButton> {
  TemboButtonStyle get _style {
    final cs = getColorScheme(context);
    final consts = getUIConstants();

    return widget.style ??
        TemboButtonStyle.filled(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          borderRadius: consts.borderRadius,
        );
  }

  @override
  Widget build(BuildContext context) {
    final height = _style.height;
    final width = _style.width;

    final consts = getUIConstants();
    final cs = getColorScheme(context);

    final borderColor =
        _style.borderColor ?? (_style.isOutline ? cs.primary : null);
    final backgroundColor =
        _style.backgroundColor ?? (_style.isFilled ? cs.primary : null);

    final alignment =
        width == double.maxFinite || width != null ? Alignment.center : null;

    final radius = _style.borderRadius ?? consts.borderRadius;
    final padding = _style.padding ?? _defPadding;
    final borderRadius = _style.borderRadius == null
        ? defBorderRadius
        : BorderRadius.circular(radius);
    final borderWidth = _style.borderWidth ?? consts.borderWidth;

    final decoImage = _style.imageProvider == null
        ? null
        : DecorationImage(image: _style.imageProvider!, fit: BoxFit.fill);

    return Material(
      color: backgroundColor,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: _onPressed,
        onLongPress: _onLongPress,
        borderRadius: borderRadius,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          alignment: alignment,
          decoration: TemboBoxDecoration(
            radius: radius,
            borderWidth: borderWidth,
            borderColor: borderColor,
            image: decoImage,
          ),
          child: getChild(context),
        ),
      ),
    );

    // return TextButton(
    //   onPressed: _onPressed,
    //   onLongPress: _onLongPress,
    //   style: _style.buttonStyle,
    //   child: getChild(context),
    // );
  }

  void _onPressed() {
    widget.onPressed();
  }

  void _onLongPress() {
    if (widget.onLongPress != null) widget.onLongPress!();
  }

  Widget getChild(BuildContext context) {
    final cs = getColorScheme(context);
    final foregroundColor =
        _style.foregroundColor ?? (_style.isFilled ? cs.onPrimary : cs.primary);

    final showLoading = widget.showLoading ?? false;

    if (showLoading) {
      return Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(foregroundColor),
        ),
      );
    }

    return DefaultTextStyle(
      textAlign: TextAlign.center,
      style: _style.getTextStyle?.copyWith(color: foregroundColor) ??
          context.textTheme.bodyMedium.bold.withColor(foregroundColor),
      child: IconTheme(
        data: IconThemeData(color: foregroundColor),
        child: widget.child,
      ),
    );
  }
}

class TemboPlainTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle? style;

  final bool _decorated;

  const TemboPlainTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
  }) : _decorated = false;

  const TemboPlainTextButton.decorated({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
  }) : _decorated = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RichText(
        text: TextSpan(
          text: text,
          style: (style ??
                  context.textTheme.bodyMedium.bold
                      .withColor(context.colorScheme.primary))
              .copyWith(
            decoration: _decorated ? TextDecoration.underline : null,
            decorationColor: _decorated ? context.colorScheme.primary : null,
          ),
          recognizer: TapGestureRecognizer()..onTap = onPressed,
        ),
      ),
    );
  }
}
