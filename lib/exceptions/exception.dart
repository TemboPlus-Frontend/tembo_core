import 'package:tembo_core/constants/locale.dart';

export 'utils.dart';

part 'message.dart';

class TemboException implements Exception {
  final Message message;
  const TemboException(this.message);

  String get msg => message.fromLocale(getCurrentLocale());

  factory TemboException.unknown() => const TemboException(_unknownMessage);

  factory TemboException.timeout() => const TemboException(_timeoutMessage);

  String fromLocale(TemboLocale locale) =>
      locale.isEN ? message.enMessage : message.swMessage;

  @override
  String toString() => 'TemboException(message: $message)';
}
