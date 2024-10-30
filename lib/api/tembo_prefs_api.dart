import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:tembo_core/tembo_core.dart';

/// Should be initiated with [TemboPreferencesAPI.init] on the main function.
///
/// Used to store data that should not be deleted when the user logs out in the app.
/// They should only be deleted when a user decides to clear cache & data
/// from phone settings
class TemboPreferencesAPI extends BaseLocalAPI {
  static const _boxName = "tembo_preferences";
  static Future<void> init() async => await Hive.openBox(_boxName);

  TemboPreferencesAPI._() {
    final box = Hive.box(_boxName);
    super.initBox(box);
  }

  Future<void> setDuration(Duration d) async {
    await UserPreferencesAPI.instance
        .put(_durationKey, d.inMilliseconds.toString());
  }

  Duration get duration {
    final durationString = UserPreferencesAPI.instance.get(_durationKey);
    if (durationString == null) return const Duration(days: 7);
    return Duration(milliseconds: int.parse(durationString));
  }

  static final instance = TemboPreferencesAPI._();

  static const _durationKey = "duration";
  static const _lidKey = "last_install_date";
  static const _appKey = "app";

  /// if user's last login date is past selected duration clears user preferences
  Future<void> handleLongTimeSinceLastLogIn() async {
    final requireLogin = _hasExceededDuration();
    if (!requireLogin) return;

    await UserPreferencesAPI.instance.clear().catchError((_) {});
  }

  Future<void> resetLastLogInDate() async {
    return put(_lidKey, DateTime.now().toJson());
  }

  DateTime? _getLastLogInDate() {
    final lastInstall = get(_lidKey);
    if (lastInstall == null) return null;
    return DateTime.parse(lastInstall);
  }

  bool _hasExceededDuration() {
    final lastInstallDate = _getLastLogInDate();
    if (lastInstallDate == null) return true;

    final now = DateTime.now();
    final diff = now.difference(lastInstallDate).abs();
    debugPrint("LLD: $lastInstallDate");
    debugPrint("Now: $now");
    debugPrint("Now Vs LLD (in hrs): ${now.difference(lastInstallDate).abs().inHours}");
    debugPrint("Duration Limit: $duration");
    debugPrint("Exceeded?     : ${diff > duration}");

    return diff > duration;
  }

  Future<void> registerProject(Project project) async {
    return put(_appKey, project.name);
  }

  /// Returns [Project.temboPlus] by default
  Project getProject() {
    return Project.values.firstWhere(
      (e) => e.name == TemboPreferencesAPI.instance.get(_appKey),
      orElse: () => Project.temboPlus,
    );
  }
}
