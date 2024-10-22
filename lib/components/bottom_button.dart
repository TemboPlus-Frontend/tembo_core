import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String? label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: horizontal(20),
        child: TemboTextButton(
          onPressed: onPressed,
          style: TemboButtonStyle.filled(
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