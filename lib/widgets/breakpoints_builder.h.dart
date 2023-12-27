import 'package:flutter/material.dart';

class BreakPointsBuilder {
  const BreakPointsBuilder._();

  static Widget foldFor2BreakPoints({
    required num b1,
    required num b2,
    required Widget Function(
      BuildContext context,
      double maxWidth,
      bool isOnB1,
      bool isOnB2,
    ) builder,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxWidth = constr.maxWidth;
        if (maxWidth <= b1) return builder(context, maxWidth, true, false);
        if (maxWidth <= b2) return builder(context, maxWidth, false, true);
        return builder(context, maxWidth, false, true);
      },
    );
  }

  static Widget for1BreakPoint({
    required num b1,
    required Widget Function(BuildContext context, BoxConstraints constr) onB1,
    Widget Function(BuildContext context, BoxConstraints constr)?
        onGreaterThanB1,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxWidth = constr.maxWidth;
        if (maxWidth <= b1) return onB1(context, constr);
        if (onGreaterThanB1 != null) return onGreaterThanB1(context, constr);
        return onB1(context, constr);
      },
    );
  }

  static Widget for2BreakPoints({
    required num b1,
    required num b2,
    required Widget Function(BuildContext context, double maxWidth) onB1,
    required Widget Function(BuildContext context, double maxWidth) onB2,
    Widget Function(BuildContext context, double maxWidth)? onGreaterThanB2,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxWidth = constr.maxWidth;
        if (maxWidth <= b1) return onB1(context, maxWidth);
        if (maxWidth <= b2) return onB2(context, maxWidth);
        if (onGreaterThanB2 != null) return onGreaterThanB2(context, maxWidth);
        return onB2(context, maxWidth);
      },
    );
  }

  static Widget for2BreakPointsWithScalefactor({
    required num b1,
    required num b2,
    required Widget Function(BuildContext context, double maxWidth) onB1,
    required Widget Function(BuildContext context, double maxWidth) onB2,
    Widget Function(BuildContext context, double maxWidth)? onGreaterThanB2,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxWidth = constr.maxWidth;
        Widget getChild() {
          if (maxWidth <= b1) return onB1(context, maxWidth);
          if (maxWidth <= b2) return onB2(context, maxWidth);
          if (onGreaterThanB2 != null) {
            return onGreaterThanB2(context, maxWidth);
          }
          return onB2(context, maxWidth);
        }

        double getScaleFactor() {
          double scaleFactor() {
            if (maxWidth <= b1) return maxWidth / b1;
            if (maxWidth <= b2) return maxWidth / b2;
            if (onGreaterThanB2 != null) return 1;
            return 1;
          }

          final result = scaleFactor();
          if (result < .8) return .8;
          return result;
        }

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: getScaleFactor(),
          ),
          child: getChild(),
        );
      },
    );
  }

  static Widget for3BreakPoints({
    required num b1,
    required num b2,
    required num b3,
    required Widget Function(BuildContext context, double maxWidth) onB1,
    required Widget Function(BuildContext context, double maxWidth) onB2,
    required Widget Function(BuildContext context, double maxWidth) onB3,
    Widget Function(BuildContext context, double maxWidth)? onGreaterThanB3,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxWidth = constr.maxWidth;
        if (maxWidth <= b1) return onB1(context, maxWidth);
        if (maxWidth <= b2) return onB2(context, maxWidth);
        if (maxWidth <= b3) return onB3(context, maxWidth);
        if (onGreaterThanB3 != null) return onGreaterThanB3(context, maxWidth);
        return onB3(context, maxWidth);
      },
    );
  }

  static Widget for5BreakPoints({
    required num b1,
    required num b2,
    required num b3,
    required num b4,
    required num b5,
    required Widget Function(BuildContext context, double maxWidth) onB1,
    required Widget Function(BuildContext context, double maxWidth) onB2,
    required Widget Function(BuildContext context, double maxWidth) onB3,
    required Widget Function(BuildContext context, double maxWidth) onB4,
    required Widget Function(BuildContext context, double maxWidth) onB5,
    Widget Function(BuildContext context, double maxWidth)? onGreaterThanB5,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxWidth = constr.maxWidth;
        if (maxWidth <= b1) return onB1(context, maxWidth);
        if (maxWidth <= b2) return onB2(context, maxWidth);
        if (maxWidth <= b3) return onB3(context, maxWidth);
        if (maxWidth <= b4) return onB4(context, maxWidth);
        if (maxWidth <= b5) return onB5(context, maxWidth);
        if (onGreaterThanB5 != null) return onGreaterThanB5(context, maxWidth);
        return onB5(context, maxWidth);
      },
    );
  }
}
