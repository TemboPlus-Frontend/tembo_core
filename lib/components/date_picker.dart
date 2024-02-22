import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

class TemboDatePicker extends StatefulWidget {
  final DateTime date;
  final String Function(DateTime date) label;
  final ValueChanged<DateTime> onSelected;
  final TemboButtonStyle? style;
  final Widget Function(DateTime date, String lbl)? child;

  const TemboDatePicker({
    super.key,
    required this.date,
    this.style,
    this.child,
    required this.label,
    required this.onSelected,
  });

  @override
  State<TemboDatePicker> createState() => _TemboDatePickerState();
}

class _TemboDatePickerState extends State<TemboDatePicker> {
  onSelected(DateTime date) => widget.onSelected(date);

  void showPicker() {
    /*  final p = defaultTargetPlatform;
    if (p == TargetPlatform.iOS || p == TargetPlatform.macOS) {
      return showIOSPicker(context, onSelected);
    } */
    return showAndroidPicker(context, onSelected);
  }

  @override
  Widget build(BuildContext context) {
    final cs = getTemboColorScheme();
    return TemboTextButton(
      onPressed: showPicker,
      style: widget.style ??
          TemboButtonStyle.outline(
            borderColor: cs.border,
            borderWidth: 1.5,
            foregroundColor: context.colorScheme.onBackground,
            textStyle: context.textTheme.bodyMedium.withFW500,
            // height: kHeight,
            padding: kHorPadding + vertical(12.5),
          ),
      child: widget.child != null
          ? widget.child!(widget.date, widget.label(widget.date))
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TemboText(
                  widget.label(widget.date),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.calendar_month,
                  color: context.colorScheme.onSurface,
                )
              ],
            ),
    );
  }

  void showAndroidPicker(
    BuildContext context,
    ValueChanged<DateTime> onSelected,
  ) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.date,
      firstDate: DateTime.now().subtract(const Duration(days: 366)),
      lastDate: DateTime.now().add(const Duration(days: 366)),
    );

    if (selectedDate != null) onSelected(selectedDate);
  }

  void showIOSPicker(BuildContext context, ValueChanged<DateTime> onSelected) {
    showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints.expand(height: 400),
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TemboText(
                    "Select Date",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const TemboText(
                        "Done",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: widget.date,
                minimumDate: DateTime.now().subtract(const Duration(days: 366)),
                maximumDate: DateTime.now().add(const Duration(days: 366)),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: onSelected,
              ),
            ),
          ],
        );
      },
    );
  }
}
