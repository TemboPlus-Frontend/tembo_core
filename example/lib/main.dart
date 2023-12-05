import 'package:example/components.dart';

import 'source.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootNavKey,
      scaffoldMessengerKey: rootMessengerKey,
      theme: ThemeData(fontFamily: "TTHoves"),
      home: const ComponentsPreview(),
    );
  }
}
