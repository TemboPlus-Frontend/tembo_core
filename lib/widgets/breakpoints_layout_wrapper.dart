import 'package:flutter/widgets.dart';

import 'layout_wrapper.dart';

class BreakpointsLayoutBuilder extends StatefulWidget {
  final TemboViewBuilder? onB1, onB2, onB3, maxBuilder;
  final int? b1, b2, b3;

  const BreakpointsLayoutBuilder.one({
    super.key,
    required this.onB1,
    required this.b1,
    this.maxBuilder,
  })  : b2 = null,
        b3 = null,
        onB2 = null,
        onB3 = null;

  const BreakpointsLayoutBuilder.two({
    super.key,
    required this.onB1,
    required this.b1,
    required this.b2,
    required this.onB2,
    this.maxBuilder,
  })  : b3 = null,
        onB3 = null;

  const BreakpointsLayoutBuilder.three({
    super.key,
    required this.b1,
    required this.b2,
    required this.b3,
    required this.onB1,
    required this.onB2,
    required this.onB3,
    this.maxBuilder,
  });

  bool get hasOneBreakpoint =>
      b1 != null &&
      onB1 != null &&
      b2 == null &&
      onB2 == null &&
      b3 == null &&
      onB3 == null;

  bool get hasTwoBreakpoint =>
      b1 != null &&
      onB1 != null &&
      b2 != null &&
      onB2 != null &&
      b3 == null &&
      onB3 == null;

  bool get hasThreeBreakpoint =>
      b1 != null &&
      onB1 != null &&
      b2 != null &&
      onB2 != null &&
      b3 != null &&
      onB3 != null;

  @override
  State<BreakpointsLayoutBuilder> createState() =>
      _BreakpointsLayoutBuilderState();
}

class _BreakpointsLayoutBuilderState extends State<BreakpointsLayoutBuilder> {
  TemboViewBuilder? builder;
  late Widget built;

  @override
  Widget build(BuildContext context) {
    if (widget.hasOneBreakpoint) {
      return LayoutBuilder(builder: (context, constr) {
        late TemboViewBuilder newBuilder;
        final maxWidth = constr.maxWidth;

        if (maxWidth <= widget.b1!) newBuilder = widget.onB1!;
        if ((maxWidth > widget.b1!) && widget.maxBuilder != null) {
          newBuilder = widget.maxBuilder!;
        }

        if (newBuilder != builder) {
          builder = newBuilder;
          built = newBuilder(context, constr);
        }
        return built;
      });
    }

    if (widget.hasTwoBreakpoint) {
      return LayoutBuilder(builder: (context, constr) {
        late TemboViewBuilder newBuilder;
        final maxWidth = constr.maxWidth;

        if (maxWidth <= widget.b1!) newBuilder = widget.onB1!;
        if (maxWidth <= widget.b2!) newBuilder = widget.onB2!;
        if ((maxWidth > widget.b2!) && widget.maxBuilder != null) {
          newBuilder = widget.maxBuilder!;
        }

        if (newBuilder != builder) {
          builder = newBuilder;
          built = newBuilder(context, constr);
        }
        return built;
      });
    }

    if (widget.hasThreeBreakpoint) {
      return LayoutBuilder(builder: (context, constr) {
        late TemboViewBuilder newBuilder;
        final maxWidth = constr.maxWidth;

        if (maxWidth <= widget.b1!) newBuilder = widget.onB1!;
        if (maxWidth <= widget.b2!) newBuilder = widget.onB2!;
        if (maxWidth <= widget.b3!) newBuilder = widget.onB3!;
        if ((maxWidth > widget.b3!) && widget.maxBuilder != null) {
          newBuilder = widget.maxBuilder!;
        }

        if (newBuilder != builder) {
          builder = newBuilder;
          built = newBuilder(context, constr);
        }
        return built;
      });
    }

    return built;
  }
}
