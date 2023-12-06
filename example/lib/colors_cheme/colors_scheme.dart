import 'package:example/colors_cheme/color_box.dart';
import 'package:example/source.dart';

class ColorsScheme extends StatelessWidget {
  const ColorsScheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontal() + vertical(),
      child: const Wrap(
        spacing: 20,
        runSpacing: 40,
        children: [
          ColorBox(
            "Background",
            TemboColors.background,
            TemboColors.onBackground,
          ),
          ColorBox(
            "Primary",
            TemboColors.primary,
            TemboColors.onPrimary,
          ),
          ColorBox(
            "Primary Container",
            TemboColors.primaryContainer,
            TemboColors.onPrimaryContainer,
          ),
          ColorBox(
            "Secondary",
            TemboColors.secondary,
            TemboColors.onSecondary,
          ),
          ColorBox(
            "Surface ",
            TemboColors.surface,
            TemboColors.onSurface,
          ),
          ColorBox(
            "Surface Container",
            TemboColors.surfaceContainer,
            TemboColors.onSurfaceContainer,
          ),
          ColorBox(
            "Error ",
            TemboColors.error,
            TemboColors.onError,
          ),
        ],
      ),
    );
  }
}
