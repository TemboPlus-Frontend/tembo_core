import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'source.dart';

import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  runApp(const MainApp());
}

Future<void> initLocalStorage() async {
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  await UserPreferencesAPI.init();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (context, ref, _) {
        final theme = ref.watch(themeManagerProvider);
        return MaterialApp(
          navigatorKey: rootNavKey,
          scaffoldMessengerKey: rootMessengerKey,
          theme: theme.flexColorScheme.toTheme,
          home: const App(),
        );
      }),
    );
  }
}
