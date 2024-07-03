import 'package:tembo_core/tembo_core.dart';

class TokenAPI {
  TokenAPI._();
  static final instance = TokenAPI._();

  final _api = UserPreferencesAPI.instance;

  static const _key = "api_token";

  /// Should only be called once when the user logs in
  Future<void> saveToken(String token) => _api.put(_key, token);

  Future<void> deleteToken() => _api.delete(_key);

  String? getToken() => _api.get(_key);
}
