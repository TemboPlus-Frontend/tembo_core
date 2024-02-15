import 'telecom.dart';

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
