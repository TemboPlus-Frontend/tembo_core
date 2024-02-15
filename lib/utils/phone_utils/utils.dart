import 'package:tembo_core/exceptions/exception.dart';
import 'package:tembo_core/utils/phone_utils/mobile_number.dart';

import 'format.dart';
import 'telecom.dart';
import 'phone_number.dart';

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

Telecom? detectTelecomFromPrefix(String number) {
  try {
    late String id, compactNumber;

    if (number.startsWith("+255")) {
      compactNumber = number.substring(4);
      id = compactNumber.substring(0, 2);
    } else if (number.startsWith("255")) {
      compactNumber = number.substring(3);
      id = compactNumber.substring(0, 2);
    } else if (number.startsWith("0")) {
      compactNumber = number.substring(1);
      id = compactNumber.substring(0, 2);
    } else {
      compactNumber = number;
      id = compactNumber.substring(0, 2);
    }

    for (var telecom in Telecom.values) {
      if (telecom.prefixes.contains(id)) return telecom;
    }

    return null;
  } catch (_) {
    return null;
  }
}

///@deprecated Use [PhoneNumber] instead
typedef ParsedPhoneNumber = ({
  Telecom telecom,
  MobileNumberFormat format,
  String numberWithoutCountryPrefix,
});

///@deprecated Use [PhoneNumber.from] instead
ParsedPhoneNumber? parsePhoneNumber(String number) {
  try {
    late String id, compactNumber;
    late MobileNumberFormat format;

    if (number.startsWith("+255")) {
      compactNumber = number.substring(4);
      id = compactNumber.substring(0, 2);
      if (compactNumber.length != 9) return null;

      format = MobileNumberFormat.sp255;
    } else if (number.startsWith("255")) {
      compactNumber = number.substring(3);
      id = compactNumber.substring(0, 2);
      if (compactNumber.length != 9) return null;

      format = MobileNumberFormat.s255;
    } else if (number.startsWith("0")) {
      compactNumber = number.substring(1);
      id = compactNumber.substring(0, 2);
      if (compactNumber.length != 9) return null;

      format = MobileNumberFormat.s0;
    } else {
      compactNumber = number;
      id = compactNumber.substring(0, 2);
      if (compactNumber.length != 9) return null;

      format = MobileNumberFormat.none;
    }

    final telecom = Telecom.values.where((e) => e.prefixes.contains(id)).single;

    return (
      telecom: telecom,
      format: format,
      numberWithoutCountryPrefix: compactNumber
    );
  } catch (e) {
    return null;
  }
}

///@deprecated Use [PhoneNumber.getNumberWithFormat] instead
MobileNumber? getMobileNumberFrom(
  String phoneNumber, {
  MobileNumberFormat outputFormat = MobileNumberFormat.s255,
}) {
  final result = parsePhoneNumber(phoneNumber);
  if (result == null) return null;

  final telecom = result.telecom;
  final compactNumber = result.numberWithoutCountryPrefix;

  return MobileNumber(
    telecom: telecom,
    number: "${outputFormat.startPattern}$compactNumber",
  );
}

bool checkPhoneNumberValidity(String number) {
  if (number.isEmpty) return false;

  if (number.startsWith("+255")) return number.length == 13;
  if (number.startsWith("0")) return number.length == 10;

  return number.length == 9;
}
