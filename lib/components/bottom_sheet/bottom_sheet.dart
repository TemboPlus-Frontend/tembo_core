import 'package:flutter/material.dart';
import 'package:tembo_core/extensions/source.dart';

import '../container/decoration.dart';

class BottomSheetView extends StatefulWidget {
  final Widget child;
  final VoidCallback? onClosing;
  final num? height;

  const BottomSheetView({
    required this.child,
    this.onClosing,
    super.key,
    this.height,
  });

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    const duration = Duration(milliseconds: 300);
    controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height?.toDouble(),
      child: BottomSheet(
        onClosing: widget.onClosing ?? () {},
        animationController: controller,
        enableDrag: true,
        showDragHandle: true,
        dragHandleColor: context.colorScheme.surfaceContainer,
        backgroundColor: Colors.white,
        builder: (context) {
          return Column(
            children: [
              Expanded(child: widget.child),
            ],
          );
        },
      ),
    );
  }
}

class ModalBottomSheetView extends StatefulWidget {
  final Widget child;
  final num? height;

  const ModalBottomSheetView({
    required this.child,
    super.key,
    this.height,
  });

  @override
  State<ModalBottomSheetView> createState() => _ModalBottomSheetViewState();
}

class _ModalBottomSheetViewState extends State<ModalBottomSheetView>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    const duration = Duration(milliseconds: 300);
    controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height?.toDouble(),
      width: double.maxFinite,
      color: context.colorScheme.surface,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const BottomSheetHandle(),
          const SizedBox(height: 20),
          widget.child
        ],
      ),
    );
  }
}

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 40,
      decoration: TemboBoxDecoration(
        color: context.colorScheme.surfaceContainer,
        radius: 30,
      ),
    );
  }
}
