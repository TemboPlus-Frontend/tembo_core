import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'source.dart';

class TemboSnackbar extends SnackBar {
  final String message;
  final int? durationInSeconds;

  final bool isError;

  TemboSnackbar(
    this.message, {
    Key? key,
    this.isError = false,
    this.durationInSeconds,
  }) : super(
          key: key,
          content: _Content(message, isError),
        );

  TemboSnackbar.error(this.message, {Key? key, this.durationInSeconds})
      : isError = true,
        super(
          key: key,
          content: _Content(message, true),
        );

  @override
  Color? get backgroundColor =>
      isError ? LightTemboColors.error : LightTemboColors.primary;

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

  @override
  Widget build(BuildContext context) {
    return TemboText(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: isError ? LightTemboColors.onError : LightTemboColors.onPrimary,
        fontSize: 14,
      ),
    );
  }
}
