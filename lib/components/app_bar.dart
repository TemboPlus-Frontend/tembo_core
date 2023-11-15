import '../source.dart';

class TemboAppBar extends AppBar {
  final String? label;
  TemboAppBar({super.key, this.label, super.leading});

  @override
  Widget? get title => label == null ? null : TemboText.bold(label!);

  @override
  double? get elevation => 0;
}
