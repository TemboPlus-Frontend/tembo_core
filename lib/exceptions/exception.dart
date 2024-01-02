import 'package:tembo_core/constants/locale.dart';

export 'handle_exception.dart';

part 'exception_message.dart';

class TemboException implements Exception {
  final Message message;
  const TemboException(this.message);

  factory TemboException.unknown() => const TemboException(_unknownMessage);

  factory TemboException.timeout() => const TemboException(_timeoutMessage);

  String fromLocale(TemboLocale locale) =>
      locale.isEN ? message.enMessage : message.swMessage;
}
