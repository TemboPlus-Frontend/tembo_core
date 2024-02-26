import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tembo_core/extensions/source.dart';
import 'package:tembo_core/locales/language_settings_manager.dart';

import '../components/source.dart';
import '../exceptions/exception.dart';
import '../utils/navigation_utils.dart';
import 'app_state_notifier.dart';

class AppStateWrapper extends ConsumerStatefulWidget {
  final Widget child;
  const AppStateWrapper({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AppStateWrapperState();
}

class _AppStateWrapperState extends ConsumerState<AppStateWrapper> {
  late OverlayState overlayState;
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    overlayState = Overlay.of(context);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(appStateProvider, (previous, next) {
      next.maybeWhen(
        loading: showLoadingOverlay,
        success: (message) {
          closeLoadingOverlay();
          if (message != null) showInfoSnackbar(message);
        },
        error: (failure) {
          closeLoadingOverlay();
          _showErrorSnackbar(ref, failure);
        },
        orElse: () {},
      );
    });

    return widget.child;
  }

  showLoadingOverlay(String? message) {
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(.5),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 200,
              width: context.viewportWidth * .9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (message != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(message),
                    ),
                  TemboLoadingIndicator(
                    color: context.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    overlayState.insert(overlayEntry!);
  }

  closeLoadingOverlay() {
    try {
      overlayEntry?.remove();
    } catch (_) {
      debugPrint(_.toString());
    }
  }
}

void _showErrorSnackbar(WidgetRef ref, TemboException exc, [int? duration]) {
  final locale = ref.read(localesManagerProvider);
  return showSnackbar(exc.fromLocale(locale), duration: duration);
}
