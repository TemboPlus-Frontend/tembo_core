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
    primaryColor: Color(0xFF00308F),
    onPrimaryColor: Colors.white,
    androidPackageName: "com.temboplus.temp",
    iosBundleID: "com.temboplus.tembo",
    dynamicLinkUrl: "https://tembobank.page.link",
  ),
  dau(
    "Dau",
    fcmTopicName: "Dau",
    primaryColor: Colors.red,
    onPrimaryColor: Colors.black,
    androidPackageName: "com.temboplus.dau",
    iosBundleID: "com.temboplus.dau",
    dynamicLinkUrl: "https://dautemboplus.page.link",
  ),
  ride(
    "Ride",
    fcmTopicName: "Ride",
    primaryColor: Colors.white,
    onPrimaryColor: Colors.black,
    androidPackageName: "com.temboplus.ride",
    iosBundleID: "com.temboplus.ride",
    dynamicLinkUrl: "https://temboride.page.link",
  ),
  fantuzzi(
    "Fantuzzi",
    fcmTopicName: "",
    primaryColor: Colors.red,
    onPrimaryColor: Colors.white,
    androidPackageName: "",
    iosBundleID: "",
    dynamicLinkUrl: "",
  ),
  loopcard(
    "LoopCard",
    fcmTopicName: "",
    primaryColor: Color(0xffF3F3E0),
    onPrimaryColor: Colors.black,
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

ThemeData getTheme(BuildContext context) {
  return getThemeData(context);
}

ThemeData getThemeData(BuildContext context) {
  final project = getProject();
  final isDarkMode = context.isDarkMode;

  switch (project) {
    case Project.dau:
      return dauTheme;
    case Project.ride:
      return rideTheme;
    case Project.fantuzzi:
      return fantuzziTheme;
    case Project.loopcard:
      return loopcardTheme;
    default:
      return isDarkMode ? temboDarkTheme : temboTheme;
  }
}

ColorScheme getColorScheme(BuildContext context) {
  final project = getProject();
  final isDarkMode = context.isDarkMode;

  switch (project) {
    case Project.dau:
      return dauColorScheme;
    case Project.ride:
      return rideColorScheme;
    case Project.fantuzzi:
      return fantuzziColorScheme;
    case Project.loopcard:
      return loopcardColorScheme;
    default:
      return isDarkMode ? temboDarkColorScheme : temboLightColorScheme;
  }
}

TemboUIConstants getUIConstants() {
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
