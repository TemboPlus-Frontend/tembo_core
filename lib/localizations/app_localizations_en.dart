import 'app_localizations.dart';

/// The translations for en).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  TOC get toc => TOCEn();

  @override
  String get home => "Home";

  @override
  String get show => "Show";

  @override
  String get from => "From";

  @override
  String get phone => "Phone";

  @override
  String get sendLink => "Send link to the customer";

  @override
  String get next => "Next";

  @override
  String get transactions => "Transactions";

  @override
  String get account => "Account";

  @override
  String get done => "Done";

  @override
  String get close => "Close";

  @override
  String isRequired(String name) => "$name is required";

  @override
  String get send => "Send";

  @override
  String get comingSoon => "Coming Soon!";

  @override
  String get beCareful => "Be careful!";

  @override
  String get confirm => "Confirm";

  @override
  String get cancel => "Cancel";

  @override
  String get amount => "Amount";

  @override
  String get preview => "Preview";

  @override
  String get no => "No";

  @override
  String get hide => "Hide";

  @override
  String get refresh => "Refresh";

  @override
  String get to => "To";

  @override
  String get validationError => "Please check your information carefully";

  @override
  String get unknownError => "An unknown error happened";

  @override
  String get tryAgain => "Try Again";

  @override
  String get remove => "Remove";

  @override
  String get yes => "Yes";

  @override
  String get seeAll => "See All";
}

class TOCEn extends TOC {
  @override
  String get readAlready => "I have read and agreed to your Terms & Conditions";

  @override
  String get desc =>
      "You need to agree to our Terms and Conditions to proceed with the onboarding process";

  @override
  String get readTerms => "Read Our Terms & Conditions";
}
