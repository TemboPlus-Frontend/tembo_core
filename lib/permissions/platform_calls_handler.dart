import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import 'permission_status.dart';

typedef PermStatusCallback = void Function(PermissionStatus status);

class PlatformCallsHandler {
  final _channel = const MethodChannel('platform_calls');

  PlatformCallsHandler._() {
    _channel.setMethodCallHandler(_methodCallHandler);
  }

  static final PlatformCallsHandler instance = PlatformCallsHandler._();

  final _contactsSubject = BehaviorSubject<PermissionStatus>();
  final _notificationsSubject = BehaviorSubject<PermissionStatus>();

  Stream<PermissionStatus> get notificationsPermStatusUpdatesStream =>
      _notificationsSubject.stream;

  Stream<PermissionStatus> get contactsPermStatusUpdatesStream =>
      _contactsSubject.stream;

  Future<PermissionStatus?> checkReadContactsPermStatus() async {
    final result =
        await _channel.invokeMethod<int>('check-read-contacts-perm-status');
    if (result == null) return null;
    return PermissionStatusExtension.fromInt(result);
  }

  Future<PermissionStatus?> requestReadContactsAccess() async {
    final result =
        await _channel.invokeMethod<int>('request-contacts-read-perm');
    if (result == null) return null;
    return PermissionStatusExtension.fromInt(result);
  }

  Future<PermissionStatus?> checkNotificationsPostPermStatus() async {
    final result =
        await _channel.invokeMethod<int>('check-notifications-perm-status');
    if (result == null) return null;
    return PermissionStatusExtension.fromInt(result);
  }

  Future<PermissionStatus?> requestNotificationsPostAccess() async {
    final result =
        await _channel.invokeMethod<int>('request-notifications-post-perm');
    if (result == null) return null;
    return PermissionStatusExtension.fromInt(result);
  }

  Future<int?> getContactsCount() async {
    final result = await _channel.invokeMethod<int>('get-all-contacts-count');
    return result;
  }

  /// handling events / responses from the ios native code because of the inability to
  /// pass async callback on the [channel.setMethodCallHandler(handleCall)] on the iOS implementation
  Future<dynamic> _methodCallHandler(MethodCall call) async {
    switch (call.method) {
      case "notifications-post-perm-status-update":
        return _handleNotificationsPermStatusUpdates(call);
      case "read-contacts-perm-status-update":
        return _handleContactsPermStatusUpdates(call);
    }
  }

  void _handleNotificationsPermStatusUpdates(MethodCall call) {
    final index = call.getStatus();
    if (index == null) return;

    final status = PermissionStatusExtension.fromInt(index);
    _notificationsSubject.add(status);
  }

  void _handleContactsPermStatusUpdates(MethodCall call) {
    final index = call.getStatus();
    if (index == null) return;

    final status = PermissionStatusExtension.fromInt(index);
    _contactsSubject.add(status);
  }
}

extension _DynamicExt on MethodCall {
  int? getStatus() {
    try {
      return arguments as int;
    } catch (_) {
      return null;
    }
  }
}
