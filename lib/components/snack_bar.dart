import 'package:flutter/material.dart';
import 'package:tembo_core/app/app.dart';

import '../constants/source.dart';
import 'source.dart';

class TemboSnackbar extends SnackBar {
  final String message;
  final int? durationInSeconds;

  final bool isError;

  TemboSnackbar(
    this.message, {
    this.isError = false,
    this.durationInSeconds,
    super.key,
  }) : super(
          content: _Content(message, isError),
        );

  TemboSnackbar.error(this.message, {super.key, this.durationInSeconds})
      : isError = true,
        super(
          content: _Content(message, true),
        );

  TemboColorScheme get scheme {
    return getTemboColorScheme();
  }

  @override
  Color? get backgroundColor => isError ? scheme.error : scheme.primary;

  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));

  @override
  double? get elevation => 0;

  @override
  Duration get duration => Duration(seconds: durationInSeconds ?? 2);
}

class _Content extends StatelessWidget {
  final bool isError;
  final String message;
  const _Content(this.message, this.isError);

  TemboColorScheme get scheme {
    return getTemboColorScheme();
  }

  @override
  Widget build(BuildContext context) {
    return TemboText(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: isError ? scheme.onError : scheme.onPrimary,
        fontSize: 14,
      ),
    );
  }
}
