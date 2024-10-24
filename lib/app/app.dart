import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/themes/dau.dart';
import 'package:tembo_core/constants/themes/ride.dart';
import 'package:tembo_core/constants/ui/_ui_constants.dart';
import 'package:tembo_core/constants/ui/default.dart';
import 'package:tembo_core/tembo_core.dart';

import '../constants/themes/fantuzzi.dart';

enum Project {
  temboPlus(
    "TemboPlus",
    fcmTopicName: "TemboPlus",
    primaryColor: DefaultTemboColors.primary,
    onPrimaryColor: DefaultTemboColors.onPrimary,
    androidPackageName: "com.temboplus.temp",
    iosBundleID: "com.temboplus.tembo",
    dynamicLinkUrl: "https://tembobank.page.link",
  ),
  dau(
    "Dau",
    fcmTopicName: "Dau",
    primaryColor: DauColors.primary,
    onPrimaryColor: DauColors.onPrimary,
    androidPackageName: "com.temboplus.dau",
    iosBundleID: "com.temboplus.dau",
    dynamicLinkUrl: "https://dautemboplus.page.link",
  ),
  ride(
    "Ride",
    fcmTopicName: "Ride",
    primaryColor: RideColors.primary,
    onPrimaryColor: RideColors.onPrimary,
    androidPackageName: "com.temboplus.ride",
    iosBundleID: "com.temboplus.ride",
    dynamicLinkUrl: "https://temboride.page.link",
  ),
  fantuzzi(
    "Fantuzzi",
    fcmTopicName: "",
    primaryColor: FantuzziColors.primary,
    onPrimaryColor: FantuzziColors.onPrimary,
    androidPackageName: "",
    iosBundleID: "",
    dynamicLinkUrl: "",
  ),
  loopcard(
    "LoopCard",
    fcmTopicName: "",
    primaryColor: LoopCardLightColors.primary,
    onPrimaryColor: LoopCardLightColors.onPrimary,
    androidPackageName: "com.temboplus.loopcard",
    iosBundleID: "com.temboplus.loopcard",
    dynamicLinkUrl: "",
  ),
  ;

  final String label;

  /// See TemboWallet/Notifications/SetUpManager
  final String fcmTopicName;

  final Color primaryColor;
  final Color onPrimaryColor;
  final String androidPackageName;
  final String iosBundleID;
  final String dynamicLinkUrl;

  const Project(
    this.label, {
    required this.fcmTopicName,
    required this.primaryColor,
    required this.onPrimaryColor,
    required this.androidPackageName,
    required this.iosBundleID,
    required this.dynamicLinkUrl,
  });
}

Future<void> registerApp(Project project) =>
    TemboPreferencesAPI.instance.registerProject(project);

Project getProject() => TemboPreferencesAPI.instance.getProject();

/// Provide context if you want to turn all text-themes colors to black
ThemeData getTheme([BuildContext? context]) {
  var theme = getColorScheme().toTheme;
  if (context != null) {
    theme = theme.copyWith(
        textTheme: TextTheme(
      titleLarge: context.textTheme.titleLarge.black.defaultFF,
      titleMedium: context.textTheme.titleMedium.black.defaultFF,
      titleSmall: context.textTheme.titleSmall.black.defaultFF,
      displayLarge: context.textTheme.displayLarge.black.defaultFF,
      displayMedium: context.textTheme.displayMedium.black.defaultFF,
      displaySmall: context.textTheme.displaySmall.black.defaultFF,
      bodyMedium: context.textTheme.bodyMedium.black.defaultFF,
      bodyLarge: context.textTheme.bodyLarge.black.defaultFF,
      bodySmall: context.textTheme.bodySmall.black.defaultFF,
      headlineMedium: context.textTheme.headlineMedium.black.defaultFF,
      headlineLarge: context.textTheme.headlineLarge.black.defaultFF,
      headlineSmall: context.textTheme.headlineSmall.black.defaultFF,
    ));
  }

  return theme;
}

FlexColorScheme getColorScheme() {
  final project = getProject();
  switch (project) {
    case Project.dau:
      return dauTemboLightFlexColorScheme;
    case Project.ride:
      return rideLightFlexColorScheme;
    case Project.fantuzzi:
      return fantuzziLightFlexColorScheme;
    case Project.loopcard:
      return loopCardLightFlexColorScheme;
    default:
      return defaultLightFlexColorScheme;
  }
}

TemboColorScheme get temboColorScheme => getTemboColorScheme();

TemboColorScheme getTemboColorScheme() {
  final project = getProject();
  switch (project) {
    case Project.dau:
      return dauTemboAppLightScheme;
    case Project.ride:
      return rideLightColorScheme;
    case Project.fantuzzi:
      return fantuzziLightColorScheme;
    case Project.loopcard:
      return loopCardLightColorScheme;
    default:
      return defaultLightColorScheme;
  }
}

TemboUIConstants getTemboUIConstants() {
  final project = getProject();
  switch (project) {
    case Project.loopcard:
      return LoopCardUIConstants();
    default:
      return TemboDefaultUIConstants();
  }
}

class InitialApp extends StatelessWidget {
  final Project project;
  const InitialApp(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: kFontFamily),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Builder(builder: (context) {
          return Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(color: project.primaryColor),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*  Image.asset(
                  "assets/images/logos/logo.png",
                  height: 120,
                ),
                vSpace(), */
                TemboText.bold(
                  project.label,
                  style: context.textTheme.displaySmall
                      .withColor(project.onPrimaryColor),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
