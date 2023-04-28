import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/config/size_constants.dart';

final theme = ThemeData(
  primaryColorDark: const Color(0xfff1f2f6),
  primaryColorLight: const Color(0xFF8fc0b5),
  primaryColor: const Color(0xff8770FC),
  hintColor: const Color(0xFFB0B0B0),
  colorScheme: const ColorScheme.light(
    primary: Color(0xfff1f2f6),
    secondary: Color(0xffffffff),
    background: Color(0xFF393a3c),
  ),
  scaffoldBackgroundColor: const Color(0xff242527),//const Color(0xff242527),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xfff1f2f6),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xFF393a3c),
    errorStyle: const TextStyle(
      color: Color(0xffed5565)
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: const BorderSide(
        width: 0.8,
        color: Color(0xfff1f2f6),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: const BorderSide(
        width: 0.8,
        color: Color(0xffed5565),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: const BorderSide(
        width: 0.8,
        color: Color(0xffed5565),
      ),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
       color:  Color(0xfff1f2f6),
    ), 
    bodyLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
       color:  Color(0xfff1f2f6),
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
       color:  Color(0xfff1f2f6),
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      color: Color(0xFFFFFFFF),
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color:  Color(0xfff1f2f6),
    ),
  ),
);