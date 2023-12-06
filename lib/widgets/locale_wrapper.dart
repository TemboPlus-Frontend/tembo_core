import 'package:tembo_ui/source.dart';

class LocaleWrapper extends StatelessWidget {
  const LocaleWrapper({
    super.key,
    required this.child,
  });

  final Widget Function(BuildContext c, TemboLocale l) child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final l = ref.watch(localesManagerProvider);
        return child(context, l);
      },
    );
  }
}
