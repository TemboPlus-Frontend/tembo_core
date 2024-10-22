const shareText =
    "Tembo ni huduma mpya ya kibenki. Ni bora kuliko mitandao ya simu au benki za kawaida. Tumia link hii kuipata:";

class DeepLinksManager {
  //final dynamicLink = FirebaseDynamicLinks.instance;

  DeepLinksManager._();

  static final DeepLinksManager instance = DeepLinksManager._();

  // Future<String> _getShortLink({
  //   required Project project,
  //   required String params,
  // }) async {
  //   var url = '${project.dynamicLinkUrl}?$params';

  //   final parameters = DynamicLinkParameters(
  //     uriPrefix: project.dynamicLinkUrl,
  //     link: Uri.parse(url),
  //     androidParameters: AndroidParameters(
  //       packageName: project.androidPackageName,
  //       fallbackUrl: Uri.parse('https://temboplus.com/'),
  //     ),
  //     iosParameters: IOSParameters(
  //       bundleId: project.iosBundleID,
  //       fallbackUrl: Uri.parse('https://temboplus.com/'),
  //     ),
  //   );

  //   final shortLink =
  //       (await dynamicLink.buildShortLink(parameters)).shortUrl.toString();
  //   return shortLink;
  //   return "";
  // }
}
