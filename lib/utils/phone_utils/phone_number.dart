// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'format.dart';
import 'telecom.dart';

enum TransactionType {
  toWallet("C2B"),
  fromWallet("B2C"),
  ;

  final String channelLabel;
  const TransactionType(this.channelLabel);
}

class PhoneNumber {
  /// Number without the country code or '0'. Should only have 9 digits for local (TZ) phone numbers.
  final String compactNumber;
  const PhoneNumber(this.compactNumber);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'compactNumber': compactNumber,
    };
  }

  String get label {
    return getNumberWithFormat(MobileNumberFormat.s255);
  }

  String getNumberWithFormat(MobileNumberFormat format) {
    return "${format.startPattern}$compactNumber";
  }

  Telecom get telecom {
    final id = compactNumber.substring(0, 2);
    return Telecom.values.where((e) => e.prefixes.contains(id)).single;
  }

  String getChannel(TransactionType type) {
    final label = type.channelLabel;
    final company = telecom.label.toUpperCase();
    return "TZ-$company-$label";
  }

  factory PhoneNumber.fromMap(Map<String, dynamic> map) {
    return PhoneNumber(map['compactNumber'] as String);
  }

  String toJson() => json.encode(toMap());

  factory PhoneNumber.fromJson(String source) =>
      PhoneNumber.fromMap(json.decode(source) as Map<String, dynamic>);

  static PhoneNumber? from(String s) {
    var number = s.trim();
    number = number.replaceAll(" ", "");

    try {
      late String id, compactNumber;

      if (number.startsWith("+255")) {
        compactNumber = number.substring(4);
        // format = MobileNumberFormat.sp255;
      } else if (number.startsWith("255")) {
        compactNumber = number.substring(3);
        // format = MobileNumberFormat.s255;
      } else if (number.startsWith("0")) {
        compactNumber = number.substring(1);
        // format = MobileNumberFormat.s0;
      } else {
        compactNumber = number;
        // format = MobileNumberFormat.none;
      }

      if (compactNumber.length != 9) return null;
      id = compactNumber.substring(0, 2);

      /// This may fail if the number is not a valid TZ phone number. So if it fails, it will return null.
      final _ = Telecom.values.where((e) => e.prefixes.contains(id)).single;
      return PhoneNumber(compactNumber);
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() => 'PhoneNumber(compactNumber: $compactNumber)';
}
