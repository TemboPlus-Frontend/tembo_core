import 'package:flutter/material.dart';

enum ViewMode { mobile, tablet, desktop }

typedef ViewBuilder = Widget Function(
  BuildContext context,
  BoxConstraints constr,
);

class LayoutWrapper extends StatelessWidget {
  final ViewBuilder desktopView, tabletView;
  final ViewBuilder? mobileView;

  const LayoutWrapper({
    super.key,
    required this.desktopView,
    required this.tabletView,
    this.mobileView,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constr) {
      final maxWidth = constr.maxWidth;
      if (maxWidth >= 2500) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 2500),
            child: desktopView(context, constr),
          ),
        );
      }
      if (maxWidth >= 1026) return desktopView(context, constr);
      if (maxWidth >= 536) return tabletView(context, constr);
      return mobileView == null
          ? tabletView(context, constr)
          : mobileView!(context, constr);
    });
  }
}

extension ViewModeExtension on ViewMode {
  bool get isDesktop => this == ViewMode.desktop;
  bool get isMobile => this == ViewMode.mobile;
  bool get isTablet => this == ViewMode.tablet;
}
