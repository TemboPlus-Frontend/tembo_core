import 'package:tembo_core/exceptions/exception.dart';
import 'package:tembo_core/utils/phone_utils/mobile_number.dart';

Message? validateTZPhone(String? text, [bool optional = false]) {
  if (text == null) {
    if (optional) return null;

    return const Message(
      enMessage: "Phone number must not be empty",
      swMessage: "Namba ya simu ni lazima uiweke",
    );
  }

  final number = parsePhoneNumber(text);
  if (number == null) {
    return const Message(
      enMessage: "Invalid TZ Phone Number",
      swMessage: "Hii sio namba sahihi inayotumika Tanzania",
    );
  }

  return null;
}
