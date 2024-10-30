import '../../models/profile.dart';
import '../user_prefs_apis/user_prefs_api.dart';

class ProfileLocalAPI {
  ProfileLocalAPI._();
  static final instance = ProfileLocalAPI._();

  final _api = UserPreferencesAPI.instance;
  static const eventKey = "profile";

  Profile? getProfile() {
    try {
      final json = _api.get(eventKey);
      return Profile.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveProfile(Profile profile) async {
    await _api.put(eventKey, profile.toJson());
  }

  Future<void> deleteProfile() async => await _api.delete(eventKey);
}
