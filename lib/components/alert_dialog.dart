import 'package:flutter/material.dart';
import '../styles/button_styles.dart';
import '../utils/source.dart';
import 'text.dart';
import 'text_button.dart';

import '../extensions/source.dart';

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
      actionText != null ? actionText!(AlertDialogAction.no) : "Cancel";

  List<Widget> buttons(BuildContext context) {
    if (isIOS) {
      return [
        if (showCancelingAction)
          TemboTextButton(
            onPressed: () {
              pop(context, AlertDialogAction.no);
            },
            style: TemboButtonStyle.transparent(
              foregroundColor: context.colorScheme.error,
            ),
            child: TemboText(cancelText),
          ),
        TemboTextButton(
          onPressed: () {
            pop(context, AlertDialogAction.yes);
          },
          style: TemboButtonStyle.transparent(),
          child: TemboText(confirmText),
        ),
      ];
    }
    return [
      if (showCancelingAction)
        TemboTextButton(
          onPressed: () {
            pop(context, AlertDialogAction.no);
          },
          style: TemboButtonStyle.transparent(
            foregroundColor: context.colorScheme.error,
          ),
          child: TemboText(cancelText),
        ),
      TemboTextButton(
        onPressed: () {
          pop(context, AlertDialogAction.yes);
        },
        style: TemboButtonStyle.filled(),
        child: TemboText(confirmText),
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
