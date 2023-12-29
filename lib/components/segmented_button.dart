import 'package:flutter/cupertino.dart';
import 'package:tembo_ui/source.dart';

class TemboSegmentedButton<T> extends SegmentedButton<T> {
  final num breakpoint;
  const TemboSegmentedButton({
    super.key,
    this.breakpoint = 300,
    required super.segments,
    required super.selected,
    super.emptySelectionAllowed,
    super.multiSelectionEnabled,
    super.onSelectionChanged,
    super.selectedIcon,
    super.showSelectedIcon,
    super.style,
  });

  @override
  Widget build(BuildContext context) {
    return BreakPointsBuilder.for1BreakPoint(
      b1: breakpoint,
      onB1: (context, __) {
        return Row(
          children: [
            PopupMenuButton<T>(
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  CupertinoIcons.line_horizontal_3,
                  color: Colors.black,
                ),
              ),
              itemBuilder: (c) {
                return List.generate(segments.length, buildMenuItem);
              },
            ),
          ],
        );
      },
      onGreaterThanB1: (context, _) => Row(
        children: [
          SegmentedButton(
            segments: segments,
            selected: selected,
            emptySelectionAllowed: emptySelectionAllowed,
            onSelectionChanged: onSelectionChanged,
            selectedIcon: selectedIcon,
            showSelectedIcon: showSelectedIcon,
            style: style,
          ),
        ],
      ),
    );
  }

  PopupMenuEntry<T> buildMenuItem(int index) {
    final item = segments[index];

    return PopupMenuItem(
      onTap: () {
        if (onSelectionChanged != null) onSelectionChanged!({item.value});
      },
      child: item.label,
    );
  }
}
