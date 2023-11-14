import 'exception.dart';

class APIException extends AppException {
  const APIException(super.code, super.message);

  const APIException.notFound()
      : super(
          "not_found",
          "Requested resource not found",
        );

  const APIException.invalidToken()
      : super(
          "token_expired",
          "Token ime-expire. Jaribu kulogin tena",
        );

  const APIException.tokenNotFound()
      : super(
          "token_not_found",
          "Token haijapatikana. Jaribu kulogin tena",
        );

  bool get tokenError =>
      this == const APIException.invalidToken() ||
      this == const APIException.tokenNotFound();
}
