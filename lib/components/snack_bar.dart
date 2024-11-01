import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

class TemboSnackbar extends SnackBar {
  final BuildContext context;
  final String message;
  final int? durationInSeconds;

  final bool isError;

  TemboSnackbar(
    this.context,
    this.message, {
    this.isError = false,
    this.durationInSeconds,
    super.key,
  }) : super(
          content: _Content(message, isError),
        );

  TemboSnackbar.error(this.context, this.message,
      {super.key, this.durationInSeconds})
      : isError = true,
        super(
          content: _Content(message, true),
        );

  ColorScheme get scheme {
    return getColorScheme(context);
  }

  @override
  Color? get backgroundColor => isError ? scheme.error : scheme.primaryContainer;

  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(getUIConstants().borderRadius));

  @override
  double? get elevation => 0;

  @override
  Duration get duration => Duration(seconds: durationInSeconds ?? 2);
}

class _Content extends StatelessWidget {
  final bool isError;
  final String message;
  const _Content(this.message, this.isError);

  @override
  Widget build(BuildContext context) {
    final scheme = getColorScheme(context);
    return TemboText(
      message,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyMedium?.copyWith(
        color: isError ? scheme.onError : scheme.onPrimaryContainer,
        fontWeight: FontWeight.w500
      ),
    );
  }
}
