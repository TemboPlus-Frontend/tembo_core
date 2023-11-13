import 'app_localizations.dart';

/// The translations for en).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  TOC get toc => TOCEn();

  @override
  String isRequired(String name) => "$name is required";

  @override
  String get account => "Account";

  @override
  String get transactions => "Transactions";

  @override
  String get seeAll => "See All";

  @override
  String get unknownError => "An unknown error happened";

  @override
  String get tryAgain => "Try Again";

  @override
  String get to => "To";

  @override
  String get no => "No";

  @override
  String get done => "Done";

  @override
  String get next => "Next";

  @override
  String get refresh => "Refresh";

  @override
  String get send => "Send";

  @override
  String get validationError => "Please check your information carefully";

  @override
  String get amount => "Amount";

  @override
  String get sendLink => "Send link to the customer";

  @override
  String get beCareful => "Be careful!";

  @override
  String get remove => "Remove";

  @override
  String get cancel => "Cancel";

  @override
  String get show => "Show";

  @override
  String get yes => "Yes";

  @override
  String get hide => "Hide";

  @override
  String get phone => "Phone";

  @override
  String get preview => "Preview";

  @override
  String get close => "Close";

  @override
  String get comingSoon => "Coming Soon!";

  @override
  String get home => "Home";

  @override
  String get from => "From";

  @override
  String get confirm => "Confirm";
}

class TOCEn extends TOC {
  @override
  String get desc =>
      "You need to agree to our Terms and Conditions to proceed with the onboarding process";

  @override
  String get title => "Terms & Conditions";

  @override
  String get readTerms => "Read Our Terms & Conditions";

  @override
  String get readAlready => "I have read and agreed to your Terms & Conditions";
}
