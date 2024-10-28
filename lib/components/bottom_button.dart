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
        child: Column(
          /// added here for buttons on the bottom nav bar occupying entire space without it
          mainAxisSize: MainAxisSize.min,
          children: [
            TemboTextButton(
              onPressed: onPressed,
              style: style ??
                  TemboButtonStyle.filled(
                    width: double.maxFinite,
                    padding: vertical(15) + horizontal(),
                    textStyle: context.textTheme.titleLarge.bold,
                  ),
              child: isLoading
                  ? TemboLoadingIndicator(color: context.colorScheme.onPrimary)
                  : TemboText(label ?? _next.text),
            ),
          ],
        ),
      ),
    );
  }
}

const _next = Message(enMessage: "Next", swMessage: "Endelea");
