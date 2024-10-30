import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:tembo_core/api/source.dart';

import '../../constants/typedefs.dart';
import '../../models/profile.dart';
import 'api.local.dart';

/// Handles all profile operations.
///
/// Get the current saved profile from anywhere with [ProfileManager.getCurrent]
class ProfileManager {
  final _remoteApi = ProfileRemoteAPI("https://api.afloat.money/v1");
  final _localAPI = ProfileLocalAPI.instance;

  ProfileManager._() {
    UserPreferencesAPI.instance.box
        .watch(key: ProfileLocalAPI.eventKey)
        .listen((e) {
      _subject.add(_localAPI.getProfile());
    });
  }

  static final instance = ProfileManager._();

  final _subject = BehaviorSubject<Profile?>();
  Stream<Profile?> get onProfileUpdate => _subject.stream;

  Profile? getCurrent() => _localAPI.getProfile();

  /// on successful otp-verification
  Future<void> save(Profile profile) async {
    await _onProfileChange(profile);
  }

  Future<Profile> fetch() async {
    final json = await _remoteApi.getUserProfile();
    final profile = Profile.fromMap(json);
    await _onProfileChange(profile);
    return profile;
  }

  Future<Profile> update(MapSD data) async {
    final body = jsonEncode(data);
    final result = await _remoteApi.editProfile(body);
    final profile = Profile.fromMap(result);
    await _onProfileChange(profile);
    return profile;
  }

  Future<void> verifyEmail(String fbToken) async {
    return await _remoteApi.markEmailVerified(fbToken);
  }

  Future<void> _onProfileChange(Profile profile) async {
    await _localAPI.saveProfile(profile);
    _subject.sink.add(profile);
  }
}
