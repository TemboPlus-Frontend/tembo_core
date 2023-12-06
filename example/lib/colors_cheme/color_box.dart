import 'package:example/source.dart';

class ColorBox extends StatelessWidget {
  final String name;
  final Color foreground, background;
  const ColorBox(this.name, this.background, this.foreground, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TemboText.bold(name),
        vSpace(10),
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: TemboText(
            "Hello",
            style: context.textTheme.bodyMedium.withColor(foreground),
          ),
        ),
      ],
    );
  }
}
