import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    this.label,
    required this.onPressed,
    this.isLoading = false,
    this.style,
  });

  final VoidCallback onPressed;
  final String? label;
  final bool isLoading;
  final TemboButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: horizontal(10) + bottom(10),
        child: TemboTextButton(
          onPressed: onPressed,
          style: style ?? TemboButtonStyle.filled(
            height: 60,
            textStyle: context.textTheme.titleMedium.bold,
            borderRadius: kBorderRadius4,
          ),
          child: isLoading
              ? TemboLoadingIndicator(color: context.colorScheme.onPrimary)
              : TemboText(label ?? _next.text),
        ),
      ),
    );
  }
}

const _next = Message(enMessage: "Next", swMessage: "Endelea");