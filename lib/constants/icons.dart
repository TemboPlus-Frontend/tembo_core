import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

class TemboIcon {
  static IconData get homeOutline => isIOS ? CupertinoIcons.home : Icons.home_outlined;

  static IconData get shareOutline => isIOS ? CupertinoIcons.share : Icons.share_outlined;

  static IconData get personOutline => isIOS ? CupertinoIcons.person : Icons.person_outlined;
}
