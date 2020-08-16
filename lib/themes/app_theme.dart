import 'package:flutter/material.dart';

const PrimaryColor = Color(0xFF3F3D56);
const AccentColor = Color(0xff00C6FF);

ThemeData appLightTheme = ThemeData.light().copyWith(
  primaryColor: PrimaryColor,
  accentColor: AccentColor,
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  textTheme: TextTheme(
//    Theme for headlines with bolt weight
    headline1: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w500,
      fontFamily: "Montserrat",
      color: PrimaryColor,
    ),

//    Theme for headlines with medium weight
    headline2: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.normal,
      fontFamily: "Montserrat",
      color: PrimaryColor,
    ),

//    Theme for headlines with regular weight
    headline3: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w300,
      fontFamily: "Montserrat",
      color: PrimaryColor,
    ),

//    Theme for button text with regular weight
    headline4: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      fontFamily: "Montserrat",
      color: PrimaryColor,
    ),

//    Theme for remarks with bolt weight
    headline5: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      fontFamily: "Montserrat",
      color: PrimaryColor,
    ),

//    Theme for remarks with regular weight
    headline6: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      fontFamily: "Montserrat",
      color: PrimaryColor,
    ),

//    Theme for pain text
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      fontFamily: "Montserrat",
      color: PrimaryColor,
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      fontFamily: "Montserrat",
      color: PrimaryColor,
    ),
  ),
);
