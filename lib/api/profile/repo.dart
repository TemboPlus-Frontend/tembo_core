import 'dart:convert';

import 'package:tembo_core/api/source.dart';

import '../../constants/typedefs.dart';
import '../../models/profile.dart';
import '../../utils/phone_utils/phone_number.dart';

class ProfileRepository {
  final _remoteApi = ProfileRemoteAPI("https://api.afloat.money/v1");
  final _localAPI = ProfileAPI.instance;

  Future<Profile> getUserProfile() async {
    final json = await _remoteApi.getUserProfile();
    final profile = Profile.fromMap(json);
    await saveProfile(profile);
    return profile;
  }

  Future<Profile> createProfile(MapSD data) async {
    final body = jsonEncode(data);
    final result = await _remoteApi.createProfile(body);
    final profile = Profile.fromMap(result);
    await saveProfile(profile);
    return profile;
  }

  Future<Profile> updateProfile(MapSD data) async {
    final body = jsonEncode(data);
    final result = await _remoteApi.editProfile(body);
    final profile = Profile.fromMap(result);
    await saveProfile(profile);
    return profile;
  }

  Future<void> markEmailAsVerified(String fbToken) =>
      _remoteApi.markEmailAsVerified(fbToken);

  Future<({bool success, bool hasNotSetProfile})> sendOTP(
    PhoneNumber phoneNumber,
  ) =>
      _remoteApi.sendOTP(phoneNumber);

  Future<({bool success, bool hasNotSetProfile})> verifyPhone(String otp) =>
      _remoteApi.verifyPhone(otp);

  Future<void> saveProfile(Profile profile) => _localAPI.saveProfile(profile);

  Profile? getLocalProfile() => _localAPI.getProfile();

  Future<void> deleteLocalProfile() =>
      _localAPI.deleteProfile().catchError((_) {});
}
