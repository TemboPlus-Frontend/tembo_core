import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../source.dart';

class TemboDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onSelected;
  const TemboDatePicker({
    super.key,
    this.initialDate,
    required this.onSelected,
  });

  @override
  State<TemboDatePicker> createState() => _TemboDatePickerState();
}

class _TemboDatePickerState extends State<TemboDatePicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  onSelected(DateTime date) {
    selectedDate = date;
    widget.onSelected(date);
    setState(() {});
  }

  showPicker() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      showAndroidPicker(context, onSelected);
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      showIOSPicker(context, onSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showPicker();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        fixedSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide( width: 2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              selectedDate != null
                  ? DateFormat("dd/MM/yyyy").format(selectedDate!)
                  : "",
              style: TextStyle(
                color: context.colorScheme.onBackground,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            CupertinoIcons.calendar,
            color: TemboColors.onBackground,
          )
        ],
      ),
    );
  }

  showAndroidPicker(
    BuildContext context,
    ValueChanged<DateTime> onSelected,
  ) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 366)),
      lastDate: DateTime.now().add(const Duration(days: 366)),
    );

    if (selectedDate != null) onSelected(selectedDate);
  }

  showIOSPicker(BuildContext context, ValueChanged<DateTime> onSelected) {
    DateTime? date;

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
                      onPressed: () {
                        if (date != null) onSelected(date!);
                        Navigator.pop(context);
                      },
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
                initialDateTime: selectedDate ?? DateTime.now(),
                minimumDate: DateTime.now().subtract(const Duration(days: 366)),
                maximumDate: DateTime.now().add(const Duration(days: 366)),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) => date = value,
              ),
            ),
          ],
        );
      },
    );
  }
}