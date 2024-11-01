import 'dart:io';

import 'package:tembo_core/tembo_core.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> openLinkWithDeviceBrowser(String link) async {
  try {
    final url = Uri.parse(link);
    final canLaunch = await canLaunchUrl(url);
    if (!canLaunch) return false;
    return await launchUrl(url, mode: LaunchMode.externalApplication);
  } catch (e) {
    return false;
  }
}

Future<bool> openTemboPlusWebsite() {
  return openLinkWithDeviceBrowser(TEMBO_WEBSITE);
}

Future<bool> showTemboPlusPrivacyPolicy() {
  return openLinkWithDeviceBrowser(TEMBO_PRIVACY_POLICY_URL);
}

Future<bool> callSupport() async {
  return await openLinkWithDeviceBrowser("tel://$TEMBO_SUPPORT_PHONE_NUMBER");
}

Future<void> whatsappSupport() async {
  var sms = "Hi, I need some help";
  var androidUrl =
      "whatsapp://send?phone=$TEMBO_SUPPORT_PHONE_NUMBER&text=$sms";
  var iosUrl =
      "https://wa.me/$TEMBO_SUPPORT_PHONE_NUMBER?text=${Uri.parse(sms)}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    try {
      callSupport();
    } catch (_) {}
  }
}
