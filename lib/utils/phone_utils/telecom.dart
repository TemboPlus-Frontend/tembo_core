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

  String toJson() => name;

  static Telecom fromJson(String json) {
    return Telecom.values.where((e) => e.name == json).single;
  }
}
