import 'package:flutter/material.dart';
import 'package:tembo_core/app/app.dart';

const fonts = (markPro: "MarkPro", ibm: "IBMPlexSans");

const kFontFamily = "MarkPro";

const kdx = 15.0;

final defBorderRadius = BorderRadius.circular(getUIConstants().borderRadius);

const kHorPadding = EdgeInsets.symmetric(horizontal: 15);
const kPagePadding = EdgeInsets.only(top: 20, left: 15, right: 15);
const buttonPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 6);

const kMaxConstraints = BoxConstraints.expand();

Widget hSpace([double? size]) => SizedBox(width: size ?? 20);
Widget vSpace([double? size]) => SizedBox(height: size ?? 20);

EdgeInsets get zero => EdgeInsets.zero;
EdgeInsets all([double? size]) => EdgeInsets.all(size ?? 20);
EdgeInsets top([double? size]) => EdgeInsets.only(top: size ?? 20);
EdgeInsets right([double? size]) => EdgeInsets.only(right: size ?? 20);
EdgeInsets left([double? size]) => EdgeInsets.only(left: size ?? 20);
EdgeInsets bottom([double? size]) => EdgeInsets.only(bottom: size ?? 20);

EdgeInsets vertical([double? size]) =>
    EdgeInsets.symmetric(vertical: size ?? 20);
EdgeInsets horizontal([double? size]) =>
    EdgeInsets.symmetric(horizontal: size ?? 20);
