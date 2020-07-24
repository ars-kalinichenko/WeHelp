import 'package:flutter/material.dart';

const PrimaryColor = Color(0xFF3F3D56);
const AccentColor = Colors.grey;

ThemeData appLightTheme = ThemeData.light().copyWith(
  primaryColor: PrimaryColor,
  accentColor: AccentColor,
  // Define the default brightness and colors.
  brightness: Brightness.light,
  // Define the default font family.
  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          fontFamily: "Montserrat",
          color: PrimaryColor),
      headline2: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Montserrat",
          color: PrimaryColor),
      headline3: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat",
          color: PrimaryColor),
      bodyText1: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          fontFamily: "Montserrat",
          color: PrimaryColor),
      bodyText2: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          fontFamily: "Montserrat",
          color: PrimaryColor)),
);
