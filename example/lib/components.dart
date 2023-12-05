import 'package:example/form/form.dart';
import 'package:example/source.dart';

class ComponentsPreview extends StatefulWidget {
  const ComponentsPreview({super.key});

  @override
  State<ComponentsPreview> createState() => _ComponentsPreviewState();
}

class _ComponentsPreviewState extends State<ComponentsPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ListView(
          padding: horizontal(50) + top(50),
          children: const [
            ExampleForm(),
          ],
        ),
      ),
    );
  }
}
