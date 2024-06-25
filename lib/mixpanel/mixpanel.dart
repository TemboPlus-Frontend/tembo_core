// ignore_for_file: constant_identifier_names

import 'package:mixpanel_flutter/mixpanel_flutter.dart';

const _token = "ce4828939524f88e71d47cb71dce2118";

const _DEVICE_NAME_KEY = "Device Name";
const _APP_NAME_KEY = "App Name";

class MixPanelManager {
  late Mixpanel mixpanel;

  MixPanelManager._();

  static MixPanelManager instance = MixPanelManager._();

  Future<void> init({
    required String appName,
    String? deviceName,
  }) async {
    final superProps = <String, dynamic>{_APP_NAME_KEY: appName};
    if (deviceName != null) superProps[_DEVICE_NAME_KEY] = deviceName;

    mixpanel = await Mixpanel.init(
      _token,
      trackAutomaticEvents: true,
      superProperties: superProps,
    );
  }

  Future<void> track(String eventName, Map<String, dynamic> props) async {
    await mixpanel.track(eventName, properties: props);
  }

  Future<void> identifyUser(String id,
      {Map<String, dynamic>? superProps}) async {
    await mixpanel.identify(id);
    if (superProps != null) await mixpanel.registerSuperProperties(superProps);
  }

  Future<void> onUserLogout() async => await mixpanel.reset();
}
