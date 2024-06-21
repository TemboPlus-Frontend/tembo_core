import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'permission_state.dart';
import 'permission_status.dart';
import 'platform_calls_handler.dart';

final contactsPermManager =
    StateNotifierProvider<_ContactsPermissionManager, PermissionState>(
  (ref) => _ContactsPermissionManager(),
);

class _ContactsPermissionManager extends StateNotifier<PermissionState> {
  final plugin = PlatformCallsHandler.instance;

  _ContactsPermissionManager() : super(PermissionInitialState()) {
    plugin.contactsPermStatusUpdatesStream.listen(updateStatus);
  }

  Future<void> askPermission() async {
    state = LoadingState();
    final status = await plugin.requestReadContactsAccess();
    if (status != null) updateStatus(status);
  }

  Future<void> checkPermissionStatus() async {
    state = LoadingState();
    final status = await plugin.checkReadContactsPermStatus();
    if (status != null) updateStatus(status);
  }

  void updateStatus(PermissionStatus status) {
    state = PermissionRequestedState(status);
  }
}
