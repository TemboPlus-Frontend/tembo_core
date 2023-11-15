import '../../source.dart';

class TemboFormLabel extends StatelessWidget {
  final String label;
  final double? bottomSpacing;
  final TextStyle? style;
  const TemboFormLabel(this.label, {this.bottomSpacing = 10, this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bottom(bottomSpacing),
      child: TemboText(
        label,
        style: style ?? context.textTheme.bodyLarge,
      ),
    );
  }
}
