class MobileNumber {
  final Telecom telecom;
  final String number;

  MobileNumber({
    required this.telecom,
    required this.number,
  });

  bool get isSupported => telecom == Telecom.tigo || telecom == Telecom.airtel;

  String get chargeChannel => "TZ-${telecom.label.toUpperCase()}-C2B";

  String get withdrawChannel => "TZ-${telecom.label.toUpperCase()}-B2C";

  @override
  String toString() => 'MobileNumber(telecom: $telecom, number: $number)';
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

typedef ParsedPhoneNumber = ({
  Telecom telecom,
  MobileNumberFormat format,
  String numberWithoutCountryPrefix,
});

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

/// s for startsWith, p for plus
enum MobileNumberFormat {
  s255("255"),
  sp255("+255"),
  s0("0"),
  none(""),
  ;

  final String startPattern;
  const MobileNumberFormat(this.startPattern);
}

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

enum Telecom {
  vodacom(
    prefixes: ["74", "75", "76"],
    label: "Vodacom",
    company: "M-Pesa",
  ),
  airtel(
    prefixes: ["78", "79", "68", "69"],
    label: "Airtel",
    company: "Airtel-Money",
  ),
  tigo(
    prefixes: ["71", "65", "67", "77"],
    label: "Tigo",
    company: "Tigo-Pesa",
  ),
  halopesa(
    prefixes: ["62", "61"],
    label: "Halotel",
    company: "Halo-Pesa",
  ),
  ;

  String get b2cName => "TZ-${label.toUpperCase()}-B2C";

  String get c2bName => "TZ-${label.toUpperCase()}-C2B";

  final List<String> prefixes;
  final String label;
  final String company;
  const Telecom({
    required this.prefixes,
    required this.label,
    required this.company,
  });
}

extension TelecomExt on Telecom {
  bool get isVoda => this == Telecom.vodacom;
  bool get isTigo => this == Telecom.tigo;
  bool get isHalotel => this == Telecom.halopesa;
  bool get isAirtel => this == Telecom.airtel;

  bool get isCurrentlySupported => isAirtel || isTigo;
}
