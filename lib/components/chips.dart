import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/extensions/source.dart';

import '../constants/constants.dart';
import '../styles/source.dart';
import '../widgets/source.dart';
import 'text.dart';
import 'text_button.dart';

import '../app/app.dart';

class TemboChips<T> extends StatefulWidget {
  final List<T> options;
  final String Function(T option) name;
  final void Function(T option) onTap;
  final bool Function(T option) selected;

  const TemboChips({
    super.key,
    required this.options,
    required this.name,
    required this.onTap,
    required this.selected,
  });

  @override
  State<TemboChips<T>> createState() => _TemboChipsState<T>();
}

class _TemboChipsState<T> extends State<TemboChips<T>> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: kHorPadding.left,
      runSpacing: kHorPadding.left,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(widget.options.length, buildButton),
    );
  }

  Widget buildButton(int index) {
    final option = widget.options[index];
    return TemboOptionButton(
      onTap: () => widget.onTap(option),
      name: widget.name(option),
      selected: widget.selected(option),
    );
  }
}

class TemboOptionButton extends StatelessWidget {
  final void Function() onTap;
  final String name;
  final bool selected;

  const TemboOptionButton({
    super.key,
    required this.onTap,
    required this.name,
    required this.selected,
  });

  TemboButtonStyle unselectedStyle(BuildContext context) {
    final cs = getTemboColorScheme();
    return TemboButtonStyle(
      backgroundColor: context.colorScheme.surface,
      foregroundColor: context.colorScheme.onSurface,
      borderColor: cs.border,
      textStyle: context.textTheme.bodyMedium.withFW400,
      borderWidth: 1.2,
      borderRadius: kBorderRadius4,
      padding: horizontal() + vertical(),
      height: null,
      width: null,
    );
  }

  TemboButtonStyle selectedStyle(BuildContext context) {
    return unselectedStyle(context).copyWith(
      backgroundColor: context.colorScheme.secondaryContainer,
      foregroundColor: context.colorScheme.onSecondaryContainer,
      textStyle: context.textTheme.bodyMedium.bold,
      borderWidth: 0,
      borderColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = selected ? selectedStyle(context) : unselectedStyle(context);
/*     final smallStyle = style.copyWith(
      padding: horizontal(10) + vertical(3),
      textStyle: selected
          ? context.textTheme.bodySmall.bold
          : context.textTheme.bodySmall.withFW400,
    ); */

    return BreakPointsBuilder.for1BreakPoint(
      b1: 350,
      onB1: (_, __) => buildButton(style),
      onGreaterThanB1: (_, __) => buildButton(style),
    );
  }

  Widget buildButton(TemboButtonStyle style) {
    return TemboTextButton(
      onPressed: onTap,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TemboText(
            name,
            style: style.getTextStyle,
            maxLines: 2,
          ),
          if (selected)
            Padding(
              padding: left(8.0),
              child: Icon(
                CupertinoIcons.check_mark,
                color: style.foregroundColor,
              ),
            )
        ],
      ),
    );
  }
}
