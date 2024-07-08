import 'package:tembo_core/tembo_core.dart';

/// Tembo servers now suport 2 types of tokens, Bearer token mostly for Fantuzzi products and
/// just token passed as a header parameter for mostly TemboPlus products
enum TokenType {
  token("api_token"),
  bearer("bearer_token"),
  ;

  final String localStorageKeyName;
  const TokenType(this.localStorageKeyName);
}

class TokenAPI {
  TokenAPI._();
  static final instance = TokenAPI._();

  final _api = UserPreferencesAPI.instance;

  /// Should only be called once when the user logs in
  Future<void> saveToken(String token, [TokenType type = TokenType.token]) {
    return _api.put(type.localStorageKeyName, token);
  }

  Future<void> deleteToken(TokenType type) =>
      _api.delete(type.localStorageKeyName);

  Future<void> clear() async {
    await _api.delete(TokenType.bearer.localStorageKeyName);
    await _api.delete(TokenType.token.localStorageKeyName);
  }

  String? getToken(TokenType type) => _api.get(type.localStorageKeyName);
}
