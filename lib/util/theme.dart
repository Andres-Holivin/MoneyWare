import 'package:flutter/material.dart';
import 'package:money_management/util/constants.dart';

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.blue,
    primarySwatch: Colors.yellow,
    fontFamily: "Muli",
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: ConstBackgroundLight.textPrimary)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
