import 'package:example/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tembo_core/tembo_core.dart';
import './color_box.dart';

class ColorsScheme extends ConsumerWidget {
  const ColorsScheme({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeManagerProvider);
    final cs = theme.colorScheme;

    return Padding(
      padding: horizontal() + vertical(),
      child: Wrap(
        spacing: 20,
        runSpacing: 40,
        children: [
          ColorBox(
            "Primary",
            context.colorScheme.primary,
            context.colorScheme.onPrimary,
          ),
          ColorBox(
            "Primary Container",
            context.colorScheme.primaryContainer,
            context.colorScheme.onPrimaryContainer,
          ),
          ColorBox(
            "Secondary",
            context.colorScheme.secondary,
            context.colorScheme.onSecondary,
          ),
          ColorBox(
            "Secondary Container",
            context.colorScheme.secondaryContainer,
            context.colorScheme.onSecondaryContainer,
          ),
          ColorBox(
            "Surface ",
            context.colorScheme.surface,
            context.colorScheme.onSurface,
          ),
          ColorBox(
            "Surface Container",
            cs.surfaceContainer!,
            cs.onSurfaceContainer!,
          ),
          ColorBox(
            "Success ",
            cs.success!,
            cs.onSuccess!,
          ),
          ColorBox(
            "Error ",
            context.colorScheme.error,
            context.colorScheme.onError,
          ),
        ],
      ),
    );
  }
}
