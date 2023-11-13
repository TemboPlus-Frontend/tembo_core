import '../source.dart';

class TemboAppBar extends AppBar {
  final String label;
  TemboAppBar({super.key, required this.label, super.leading});

  @override
  Widget? get title => TemboText.bold(label);

  @override
  double? get elevation => 0;
}
