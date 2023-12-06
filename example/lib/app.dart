import 'package:example/colors_cheme/colors_scheme.dart';
import 'package:example/components.dart';
import 'package:example/source.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: const [
              TemboText("Colors"),
              TemboText("Components"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                ColorsScheme(),
                ComponentsPreview(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
