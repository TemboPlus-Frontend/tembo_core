import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/app/app.dart';
import 'package:tembo_core/components/container/decoration.dart';
import 'package:tembo_core/extensions/source.dart';

import '../constants/constants.dart';
import '../widgets/breakpoints_builder.h.dart';
import 'container/container.dart';
import 'text.dart';

class TemboSegmentedButton<T> extends StatelessWidget {
  final num breakpoint;
  final String Function(T value) name;
  final void Function(T value)? onTap;
  final T current;
  final List<T> options;
  final Widget Function(T value)? optionBuilder;

  const TemboSegmentedButton({
    super.key,
    this.breakpoint = 300,
    this.onTap,
    required this.name,
    required this.current,
    required this.options,
    this.optionBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final consts = getUIConstants();

    return BreakPointsBuilder.for1BreakPoint(
      b1: breakpoint,
      onB1: (context, __) {
        return Row(
          children: [
            PopupMenuButton<T>(
              splashRadius: consts.borderRadius,
              child: TemboContainer(
                padding: horizontal(15) + vertical(5),
                decoration: TemboBoxDecoration(
                  borderWidth: consts.borderWidth,
                  radius: consts.borderRadius,
                ),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.line_horizontal_3,
                      color: Colors.black,
                    ),
                    hSpace(10),
                    TemboText.w500(
                      name(current),
                      style: context.textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              itemBuilder: (c) {
                return List.generate(options.length, buildMenuItem);
              },
            ),
          ],
        );
      },
      onGreaterThanB1: (context, _) => Row(
        children: [
          SegmentedButton(
            segments: options
                .map(
                  (e) => ButtonSegment(
                      value: e,
                      label: e == current
                          ? TemboText.w500(name(e))
                          : TemboText.w400(name(e))),
                )
                .toList(),
            selected: {current},
            onSelectionChanged: (e) => onTap != null ? onTap!(e.first) : () {},
            style: const ButtonStyle(
                side: WidgetStatePropertyAll(BorderSide(width: 1.5))),
          ),
        ],
      ),
    );
  }

  PopupMenuEntry<T> buildMenuItem(int index) {
    final item = options[index];
    final active = current == item;

    return PopupMenuItem(
      onTap: () {
        if (onTap != null) onTap!(item);
      },
      child: Builder(builder: (context) {
        var style = context.textTheme.bodyMedium.withFW400;
        if (active) style = style.bold;
        return DefaultTextStyle(
          style: style,
          child: TemboText(name(item)),
        );
      }),
    );
  }
}
