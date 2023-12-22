import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../source.dart';

class TemboDatePicker extends StatefulWidget {
  final DateTime? date;
  final String Function(DateTime date) label;
  final ValueChanged<DateTime> onSelected;
  final TemboButtonStyle? style;

  const TemboDatePicker({
    super.key,
    this.date,
    this.style,
    required this.label,
    required this.onSelected,
  });

  @override
  State<TemboDatePicker> createState() => _TemboDatePickerState();
}

class _TemboDatePickerState extends State<TemboDatePicker> {
  onSelected(DateTime date) => widget.onSelected(date);

  void showPicker() {
    final p = defaultTargetPlatform;
   /*  if (p == TargetPlatform.iOS || p == TargetPlatform.macOS) {
      return showIOSPicker(context, onSelected);
    } */
    return showAndroidPicker(context, onSelected);
  }

  @override
  Widget build(BuildContext context) {
    return TemboTextButton(
      onPressed: showPicker,
      style: widget.style ??
          TemboButtonStyle.outline(
            borderColor: TemboColors.border,
            foregroundColor: context.colorScheme.onBackground,
            textStyle: context.textTheme.bodyLarge.withFW500,
          ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.date != null ? widget.label(widget.date!) : "",
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.calendar_month)
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
      initialDate: widget.date ?? DateTime.now(),
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
                  const Text(
                    "Select Date",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
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
                initialDateTime: widget.date ?? DateTime.now(),
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
