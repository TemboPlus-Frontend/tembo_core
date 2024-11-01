import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

class TemboDatePicker extends StatefulWidget {
  final DateTime? date;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? placeholder;
  final TextStyle? placeholderStyle;

  final String Function(DateTime date)? label;
  final ValueChanged<DateTime> onSelected;
  final TemboButtonStyle? style;
  final Widget Function(DateTime date, String lbl)? child;

  final bool enabled;

  String get lbl {
    try {
      if (label != null) {
        return label!(date!);
      }
      return date!.format();
    } catch (_) {
      return placeholder ?? "";
    }
  }

  const TemboDatePicker({
    super.key,
    this.date,
    this.style,
    this.child,
    this.label,
    this.firstDate,
    this.lastDate,
    required this.onSelected,
    this.enabled = true,
    this.placeholder,
    this.placeholderStyle,
  });

  @override
  State<TemboDatePicker> createState() => _TemboDatePickerState();
}

class _TemboDatePickerState extends State<TemboDatePicker> {
  onSelected(DateTime date) => widget.onSelected(date);

  void showPicker() {
    final p = defaultTargetPlatform;
    if (p == TargetPlatform.iOS || p == TargetPlatform.macOS) {
      return showIOSPicker(context, onSelected);
    }
    if (widget.enabled) {
      return showAndroidPicker(context, onSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = getColorScheme(context);
    final child = widget.date == null && widget.placeholder != null
        ? Row(
            children: [
              TemboText(
                widget.placeholder!,
                style: widget.placeholderStyle,
              ),
            ],
          )
        : widget.child != null
            ? widget.child!(widget.date!, widget.lbl)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TemboText(widget.lbl),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.calendar_month,
                    color: context.colorScheme.onSurface,
                  )
                ],
              );

    final horPadding = EdgeInsets.only(
      left: widget.style?.padding?.left ?? 15,
      right: widget.style?.padding?.right ?? 15,
    );

    final verPadding = EdgeInsets.only(
      top: widget.style?.padding?.top ?? 12.5,
      bottom: widget.style?.padding?.bottom ?? 12.5,
    );

    return TemboTextButton(
      onPressed: showPicker,
      style: widget.style ??
          TemboButtonStyle.filled(
          //  borderColor: cs.onSurface,
            // borderWidth: getUIConstants().borderWidth,
            foregroundColor: cs.onSurface,
            backgroundColor: cs.surfaceContainer,
            borderRadius: getUIConstants().borderRadius,
            textStyle: context.textTheme.bodyMedium.bold,
            padding: horPadding,
          ),
      child: Padding(
        padding: verPadding,
        child: child,
      ),
    );
  }

  void showAndroidPicker(
    BuildContext context,
    ValueChanged<DateTime> onSelected,
  ) async {
    final now = DateTime.now();
    const yearDuration = Duration(days: 366);
    final oneYearBack = now.subtract(yearDuration);
    final oneYearForward = now.add(yearDuration);

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.date,
      locale: const Locale("sw", "TZ"),
      lastDate: widget.lastDate ?? oneYearForward,
      firstDate: widget.firstDate ?? oneYearBack,
    );

    if (selectedDate != null) onSelected(selectedDate);
  }

  void showIOSPicker(BuildContext context, ValueChanged<DateTime> onSelected) {
    final now = DateTime.now();
    const yearDuration = Duration(days: 366);
    final oneYearBack = now.subtract(yearDuration);
    final oneYearForward = now.add(yearDuration);

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
                minimumDate: widget.firstDate ?? oneYearBack,
                maximumDate: widget.lastDate ?? oneYearForward,
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
