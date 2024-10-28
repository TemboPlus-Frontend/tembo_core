import 'package:flutter/material.dart';
import 'package:tembo_core/extensions/source.dart';

import '../constants/constants.dart';
import '../styles/button_styles.dart';
import '../utils/source.dart';
import 'text.dart';
import 'text_button.dart';

enum AlertDialogAction {
  yes,
  no,
  ;
}

extension ActionExt on AlertDialogAction {
  bool get confirming => this == AlertDialogAction.yes;
  bool get cancelling => this == AlertDialogAction.no;
}

Future<AlertDialogAction?> showAlertDialog(
  BuildContext context, {
  required String title,
  required String desc,
  String Function(AlertDialogAction)? actionText,
  AlertDialogAction activeAction = AlertDialogAction.no,
  bool showCancelingAction = true,
}) async {
  final actionTaken = await showAdaptiveDialog<AlertDialogAction>(
    context: context,
    builder: (_) => TemboAlertDialog(
      title: title,
      description: desc,
      actionText: actionText,
      activeAction: activeAction,
      showCancelingAction: showCancelingAction,
    ),
  );

  if (actionTaken == null) return null;
  return actionTaken;
}

class TemboAlertDialog extends StatelessWidget {
  final String title;
  final String description;
  final String Function(AlertDialogAction)? actionText;
  final AlertDialogAction activeAction;
  final bool showCancelingAction;

  const TemboAlertDialog({
    required this.title,
    required this.description,
    this.actionText,
    this.activeAction = AlertDialogAction.no,
    this.showCancelingAction = true,
    super.key,
  });

  String get confirmText =>
      actionText != null ? actionText!(AlertDialogAction.yes) : "Okay";
  String get cancelText =>
      actionText != null ? actionText!(AlertDialogAction.no) : "Hapana";

  List<Widget> buttons(BuildContext context) {
    final padding = horizontal() + vertical(10);

    return [
      TemboTextButton(
        onPressed: () {
          pop(context, AlertDialogAction.yes);
        },
        style: isAndroid
            ? activeAction.confirming
                ? TemboButtonStyle.filled(
                    padding: padding,
                    foregroundColor: context.colorScheme.onPrimary,
                    textStyle: context.textTheme.bodyMedium.bold,
                  )
                : TemboButtonStyle.outline(
                     padding: padding,
                    textStyle: context.textTheme.bodyMedium.bold,
                  )
            : TemboButtonStyle.transparent(
                textStyle: context.textTheme.bodyMedium.bold,
              ),
        child: TemboText(confirmText),
      ),
      if (showCancelingAction)
        TemboTextButton(
          onPressed: () {
            pop(context, AlertDialogAction.no);
          },
          style: isAndroid
              ? activeAction.cancelling
                  ? TemboButtonStyle.filled(
                      padding: padding,
                      foregroundColor: context.colorScheme.onPrimary,
                      textStyle: context.textTheme.bodyMedium.bold,
                    )
                  : TemboButtonStyle.outline(
                       padding: padding,
                      textStyle: context.textTheme.bodyMedium.bold,
                    )
              : TemboButtonStyle.transparent(
                  foregroundColor: context.colorScheme.primary,
                  textStyle: context.textTheme.bodyMedium.bold,
                ),
          child: TemboText(cancelText),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: TemboText.center(title),
      content: TemboText.center(description),
      actions: activeAction.cancelling
          ? buttons(context)
          : buttons(context).reversed.toList(),
    );
  }
}
