import 'package:flutter/cupertino.dart';
import 'package:tembo_core/components/container/decoration.dart';
import 'package:tembo_core/source.dart';

class TemboSegmentedButton<T> extends SegmentedButton<T> {
  final num breakpoint;
  final String Function(T value) name;
  const TemboSegmentedButton({
    super.key,
    this.breakpoint = 300,
    required this.name,
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
              splashRadius: kBorderRadius5,
              child: TemboContainer(
                padding: horizontal(15) + vertical(5),
                decoration: const TemboBoxDecoration(
                  borderWidth: 1.5,
                  radius: kBorderRadius5,
                ),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.line_horizontal_3,
                      color: Colors.black,
                    ),
                    hSpace(10),
                    TemboText.w500(
                      name(selected.first),
                      style: context.textTheme.bodyMedium,
                    )
                  ],
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
            style: style ??
                const ButtonStyle(
                    side: MaterialStatePropertyAll(BorderSide(width: 1.5))),
          ),
        ],
      ),
    );
  }

  PopupMenuEntry<T> buildMenuItem(int index) {
    final item = segments[index];
    final active = selected.contains(item.value);

    return PopupMenuItem(
      onTap: () {
        if (onSelectionChanged != null) onSelectionChanged!({item.value});
      },
      child: Builder(builder: (context) {
        var style = context.textTheme.bodyMedium.withFW400;
        if (active) style = style.bold;
        return DefaultTextStyle(
          style: style,
          child: item.label ?? TemboText(name(item.value)),
        );
      }),
    );
  }
}
