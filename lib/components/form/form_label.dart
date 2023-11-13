import '../../source.dart';

class TemboFormLabel extends StatelessWidget {
  final String label;
  final double? bottomSpacing;
  const TemboFormLabel(this.label, {this.bottomSpacing = 10, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bottom(bottomSpacing),
      child: TemboText(
        label,
        style: context.textTheme.bodyLarge,
      ),
    );
  }
}
