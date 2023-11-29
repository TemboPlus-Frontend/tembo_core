import '../source.dart';

class TemboAppBar extends AppBar {
  final String? label;
  final VoidCallback? onBackPress;
  TemboAppBar({super.key, this.label, this.onBackPress, super.leading, super.actions});

  @override
  Widget? get title => label == null ? null : TemboText.bold(label!);

  @override
  double? get elevation => 0;

  @override
  Widget? get leading => onBackPress == null ? null : BackButton(onPressed: onBackPress!);
}
