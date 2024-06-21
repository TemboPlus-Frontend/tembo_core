import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'permission_state.dart';
import 'permission_status.dart';
import 'platform_calls_handler.dart';

final notificationsPermManager =
    StateNotifierProvider<_NotificationsPermManager, PermissionState>(
  (ref) => _NotificationsPermManager(),
);

class _NotificationsPermManager extends StateNotifier<PermissionState> {
  final plugin = PlatformCallsHandler.instance;

  _NotificationsPermManager() : super(PermissionInitialState()) {
    plugin.notificationsPermStatusUpdatesStream.listen(updateStatus);
  }

  void registerListener(void Function(PermissionStatus) listener) {
    plugin.notificationsPermStatusUpdatesStream.listen(listener);
  }

  Future<void> askPermission() async {
    state = LoadingState();
    final status = await plugin.requestNotificationsPostAccess();
    if (status != null) updateStatus(status);
  }

  Future<void> checkPermissionStatus() async {
    state = LoadingState();
    final status = await plugin.checkNotificationsPostPermStatus();
    if (status != null) updateStatus(status);
  }

  void updateStatus(PermissionStatus status) {
    state = PermissionRequestedState(status);
  }
}
