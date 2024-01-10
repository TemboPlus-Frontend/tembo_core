import 'package:flutter/material.dart';

enum ViewMode { mobile, tablet, desktop }

typedef TemboViewBuilder = Widget Function(
  BuildContext context,
  BoxConstraints constr,
);

class LayoutWrapper extends StatefulWidget {
  final TemboViewBuilder desktopView, tabletView;
  final TemboViewBuilder? mobileView;

  const LayoutWrapper({
    super.key,
    required this.desktopView,
    required this.tabletView,
    this.mobileView,
  });

  @override
  State<LayoutWrapper> createState() => _LayoutWrapperState();
}

class _LayoutWrapperState extends State<LayoutWrapper> {
  TemboViewBuilder? builder;
  late Widget built;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constr) {
      final newBuilder = switch (constr.maxWidth) {
        < 536 => widget.mobileView ?? widget.tabletView,
        < 1026 => widget.tabletView,
        < 2500 => widget.desktopView,
        _ => (BuildContext _, BoxConstraints __) => Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 2500),
                child: widget.desktopView(context, constr),
              ),
            ),
      };

      if (newBuilder != builder) {
        builder = newBuilder;
        built = newBuilder(context, constr);
      }
      return built;
    });
  }
}

extension ViewModeExtension on ViewMode {
  bool get isDesktop => this == ViewMode.desktop;
  bool get isMobile => this == ViewMode.mobile;
  bool get isTablet => this == ViewMode.tablet;
}
