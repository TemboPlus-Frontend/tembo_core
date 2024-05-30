import 'dart:async';

import 'package:example/source.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import './colors_cheme/colors_scheme.dart';
import './components.dart';

typedef ThemeState = ({
  FlexColorScheme flexColorScheme,
  TemboColorScheme colorScheme,
  Project project
});

final themeManagerProvider =
    StateNotifierProvider<ThemeManager, ThemeState>((ref) => ThemeManager());

class ThemeManager extends StateNotifier<ThemeState> {
  ThemeManager()
      : super((
          flexColorScheme: defaultLightFlexColorScheme,
          colorScheme: lipaChinaLightColorScheme,
          project: Project.temboPlus
        ));

  void setTheme(Project project) {
    switch (project) {
      case Project.lipaChina:
        state = (
          flexColorScheme: lipaChinaLightFlexColorScheme,
          colorScheme: lipaChinaLightColorScheme,
          project: Project.lipaChina
        );
        break;
      default:
        state = (
          flexColorScheme: defaultLightFlexColorScheme,
          colorScheme: lipaChinaLightColorScheme,
          project: Project.temboPlus
        );
    }
  }
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends TemboConsumerState<App>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late Project project;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
    project = Project.temboPlus;
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TemboChips(
              options: Project.values,
              name: (e) => e.label,
              onTap: (e) async {
                await registerApp(e);
                setState(() => project = e);
                ref.read(themeManagerProvider.notifier).setTheme(e);
              },
              selected: (e) => project == e,
            ),
            vSpace(),
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
      ),
    );
  }
}
