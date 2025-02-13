import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tembo_core/tembo_core.dart';

import './colors_cheme/colors_scheme.dart';
import './components.dart';

final themeManagerProvider =
    StateNotifierProvider<ThemeManager, Project>((ref) => ThemeManager());

class ThemeManager extends StateNotifier<Project> {
  ThemeManager() : super(Project.temboPlus);

  void setTheme(Project project) {
    state = project;
  }
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late Project project;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
    project = Project.temboPlus;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: top(),
          child: Column(
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
      ),
    );
  }
}
