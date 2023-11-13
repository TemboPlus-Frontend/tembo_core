import 'app_localizations.dart';

/// The translations for sw).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  TOC get toc => TOCSw();

  @override
  String get home => "Nyumbani";

  @override
  String get show => "Onesha";

  @override
  String get from => "Kutoka";

  @override
  String get phone => "Namba Ya Simu";

  @override
  String get sendLink => "Tuma link kwa mteja";

  @override
  String get next => "Endelea";

  @override
  String get transactions => "Miamala";

  @override
  String get account => "Akaunti";

  @override
  String get done => "Tayari";

  @override
  String get close => "Funga";

  @override
  String isRequired(String name) => "$name: Ni Lazima Ujaze";

  @override
  String get send => "Tuma";

  @override
  String get comingSoon => "Inakuja Hivi Karibuni!";

  @override
  String get beCareful => "Kuwa Makini!";

  @override
  String get confirm => "Thibitisha";

  @override
  String get cancel => "Ghairi";

  @override
  String get amount => "Kiasi";

  @override
  String get preview => "Angalia";

  @override
  String get no => "Hapana";

  @override
  String get hide => "Ficha";

  @override
  String get refresh => "Onyesha upya";

  @override
  String get to => "Kwenda";

  @override
  String get validationError => "Tafadhari angalia taarifa zako vizuri";

  @override
  String get unknownError => "Kuna tatizo limetokea";

  @override
  String get tryAgain => "Jaribu Tena";

  @override
  String get remove => "Toa";

  @override
  String get yes => "Ndio";

  @override
  String get seeAll => "Ona Yote";
}

class TOCSw extends TOC {
  @override
  String get readAlready =>
      "Nimesoma na ninakubaliana na Sheria na Masharti yenu";

  @override
  String get desc =>
      "Unahitaji kukubaliana na Sheria na Masharti yetu ili kuendelea na mchakato wa kujisajili";

  @override
  String get readTerms => "Soma Sheria na Masharti Yetu";
}
