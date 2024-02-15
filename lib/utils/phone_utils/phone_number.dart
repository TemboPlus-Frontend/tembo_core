import 'dart:convert';

import 'format.dart';
import 'telecom.dart';

class PhoneNumber {
  /// Number without the country code or '0'. Should only have 9 digits for local (TZ) phone numbers.
  final String compactNumber;
  const PhoneNumber(this.compactNumber);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'compactNumber': compactNumber,
    };
  }

  String getNumberWithFormat(MobileNumberFormat format) {
    return "${format.startPattern}$compactNumber";
  }

  Telecom get telecom {
    final id = compactNumber.substring(0, 2);
    return Telecom.values.where((e) => e.prefixes.contains(id)).single;
  }

  factory PhoneNumber.fromMap(Map<String, dynamic> map) {
    return PhoneNumber(map['compactNumber'] as String);
  }

  String toJson() => json.encode(toMap());

  factory PhoneNumber.fromJson(String source) =>
      PhoneNumber.fromMap(json.decode(source) as Map<String, dynamic>);

  static PhoneNumber? from(String number) {
    try {
      late String id, compactNumber;

      if (number.startsWith("+255")) {
        compactNumber = number.substring(4);
        if (compactNumber.length != 9) return null;

        // format = MobileNumberFormat.sp255;
      } else if (number.startsWith("255")) {
        compactNumber = number.substring(3);
        id = compactNumber.substring(0, 2);
        if (compactNumber.length != 9) return null;

        // format = MobileNumberFormat.s255;
      } else if (number.startsWith("0")) {
        compactNumber = number.substring(1);
        id = compactNumber.substring(0, 2);
        if (compactNumber.length != 9) return null;

        // format = MobileNumberFormat.s0;
      } else {
        compactNumber = number;
        id = compactNumber.substring(0, 2);
        if (compactNumber.length != 9) return null;

        // format = MobileNumberFormat.none;
      }

      /// This may fail if the number is not a valid TZ phone number. So if it fails, it will return null.
      final _ = Telecom.values.where((e) => e.prefixes.contains(id)).single;

      return PhoneNumber(compactNumber);
    } catch (e) {
      return null;
    }
  }
}
