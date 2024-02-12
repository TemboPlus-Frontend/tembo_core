import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

import './colors_cheme/colors_scheme.dart';
import './components.dart';

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
