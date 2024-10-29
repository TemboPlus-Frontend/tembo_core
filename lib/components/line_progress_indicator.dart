import 'package:flutter/material.dart';

import '../app/app.dart';

class TemboLineProgressIndicator extends StatelessWidget {
  final double percentCompleted;
  final bool paintText;
  final double height;
  final TextStyle? textStyle;

  final Color? lineColor;

  const TemboLineProgressIndicator({
    required this.percentCompleted,
    this.paintText = true,
    this.height = 5,
    this.textStyle,
    this.lineColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromHeight(height),
      painter: ProgressPainter(
        context,
        percentCompleted,
        paintText: paintText,
        height: height,
        textStyle: textStyle,
        lineColor: lineColor,
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final BuildContext context;
  final double percentCompleted;
  final bool paintText;
  final double height;
  final TextStyle? textStyle;
  final Color? lineColor;

  const ProgressPainter(
    this.context,
    this.percentCompleted, {
    this.paintText = true,
    this.height = 5,
    this.textStyle,
    this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final fullWidth = paintText ? size.width - 30 : size.width;
    const radius = Radius.circular(5);
    final rect1 = Rect.fromLTWH(0, 0, fullWidth, height);
    final rrect1 = RRect.fromRectAndRadius(rect1, radius);

    final width = percentCompleted * fullWidth;
    final rect2 = Rect.fromLTWH(0, 0, width, height);
    final rrect2 = RRect.fromRectAndRadius(rect2, radius);

    final paint1 = Paint()..color = lineColor ?? getColorScheme(context).surface;
    final paint2 = Paint()..color = getColorScheme(context).primary;

    if (paintText) {
      final textPainter = TextPainter(
        text: TextSpan(
            text: "${(percentCompleted * 100).toInt()}%", style: textStyle),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(fullWidth + 8, -7));
    }

    canvas.drawRRect(rrect1, paint1);
    canvas.drawRRect(rrect2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
