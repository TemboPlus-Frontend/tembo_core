import 'package:flutter/material.dart';

class VBreakPointsBuilder {
  const VBreakPointsBuilder._();

  static Widget for1BreakPoint({
    required num b1,
    required Widget Function(BuildContext context, BoxConstraints constr) onB1,
    Widget Function(BuildContext context, BoxConstraints constr)?
        onGreaterThanB1,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxHeight = constr.maxHeight;
        if (maxHeight <= b1) return onB1(context, constr);
        if (onGreaterThanB1 != null) return onGreaterThanB1(context, constr);
        return onB1(context, constr);
      },
    );
  }

  static Widget for2BreakPoints({
    required num b1,
    required num b2,
    required Widget Function(BuildContext context, double maxHeight) onB1,
    required Widget Function(BuildContext context, double maxHeight) onB2,
    Widget Function(BuildContext context, double maxHeight)? onGreaterThanB2,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxHeight = constr.maxHeight;
        if (maxHeight <= b1) return onB1(context, maxHeight);
        if (maxHeight <= b2) return onB2(context, maxHeight);
        if (onGreaterThanB2 != null) return onGreaterThanB2(context, maxHeight);
        return onB2(context, maxHeight);
      },
    );
  }

  static Widget for2BreakPointsWithScalefactor({
    required num b1,
    required num b2,
    required Widget Function(BuildContext context, double maxHeight) onB1,
    required Widget Function(BuildContext context, double maxHeight) onB2,
    Widget Function(BuildContext context, double maxHeight)? onGreaterThanB2,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxHeight = constr.maxHeight;
        Widget getChild() {
          if (maxHeight <= b1) return onB1(context, maxHeight);
          if (maxHeight <= b2) return onB2(context, maxHeight);
          if (onGreaterThanB2 != null) {
            return onGreaterThanB2(context, maxHeight);
          }
          return onB2(context, maxHeight);
        }

        double getScaleFactor() {
          double scaleFactor() {
            if (maxHeight <= b1) return maxHeight / b1;
            if (maxHeight <= b2) return maxHeight / b2;
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
    required Widget Function(BuildContext context, double maxHeight) onB1,
    required Widget Function(BuildContext context, double maxHeight) onB2,
    required Widget Function(BuildContext context, double maxHeight) onB3,
    Widget Function(BuildContext context, double maxHeight)? onGreaterThanB3,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxHeight = constr.maxHeight;
        if (maxHeight <= b1) return onB1(context, maxHeight);
        if (maxHeight <= b2) return onB2(context, maxHeight);
        if (maxHeight <= b3) return onB3(context, maxHeight);
        if (onGreaterThanB3 != null) return onGreaterThanB3(context, maxHeight);
        return onB3(context, maxHeight);
      },
    );
  }

  static Widget for5BreakPoints({
    required num b1,
    required num b2,
    required num b3,
    required num b4,
    required num b5,
    required Widget Function(BuildContext context, double maxHeight) onB1,
    required Widget Function(BuildContext context, double maxHeight) onB2,
    required Widget Function(BuildContext context, double maxHeight) onB3,
    required Widget Function(BuildContext context, double maxHeight) onB4,
    required Widget Function(BuildContext context, double maxHeight) onB5,
    Widget Function(BuildContext context, double maxHeight)? onGreaterThanB5,
  }) {
    return LayoutBuilder(
      builder: (context, constr) {
        final maxHeight = constr.maxHeight;
        if (maxHeight <= b1) return onB1(context, maxHeight);
        if (maxHeight <= b2) return onB2(context, maxHeight);
        if (maxHeight <= b3) return onB3(context, maxHeight);
        if (maxHeight <= b4) return onB4(context, maxHeight);
        if (maxHeight <= b5) return onB5(context, maxHeight);
        if (onGreaterThanB5 != null) return onGreaterThanB5(context, maxHeight);
        return onB5(context, maxHeight);
      },
    );
  }
}
