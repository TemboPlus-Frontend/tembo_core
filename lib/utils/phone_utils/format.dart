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

extension MobileNumberFormatExt on MobileNumberFormat {
  String toJson() => name;

  static MobileNumberFormat fromJson(String json) {
    return MobileNumberFormat.values.where((e) => e.name == json).single;
  }
}
