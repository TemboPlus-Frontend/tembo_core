// ignore_for_file: constant_identifier_names

import 'package:mixpanel_flutter/mixpanel_flutter.dart';

const token = "ce4828939524f88e71d47cb71dce2118";

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
      token,
      trackAutomaticEvents: true,
      superProperties: superProps,
    );
  }

  Future<void> track(String eventName, Map<String, dynamic> props) async {
    await mixpanel.track(eventName, properties: props);
  }

  Future<void> identifyUser(String id) async => await mixpanel.identify(id);

  Future<void> onUserLogout() async => await mixpanel.reset();
}
