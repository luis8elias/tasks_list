import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/config/size_constants.dart';

final theme = ThemeData(
  useMaterial3: true,
  primaryColorDark: const Color(0xff242424),
  primaryColorLight: const Color(0xFFFFFFFF),
  primaryColor: const Color(0xff0661F1),
  hintColor: const Color(0xFFABABAB),
  colorScheme: const ColorScheme.light(
    primary: Color(0xfff1f2f6),
    secondary: Color(0xff242424),
    background: Color(0xffF9F9F9),
    onSecondary: Color(0xffbdd6ff)
  ),
  scaffoldBackgroundColor: const Color(0xffF9F9F9),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff242424),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffF9F9F9),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(kPadding * 2),
    labelStyle: const TextStyle(
      color: Color(0xFF326ec8),
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
    floatingLabelBehavior: FloatingLabelBehavior .always,
    hintStyle: const TextStyle(
      color: Color(0xFF8b8b8b)
    ),
    fillColor: const Color(0xFFFAFAFA),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: const BorderSide(
        color:Color(0xFF8b8b8b)
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: const BorderSide(
        color:Color(0xFF8b8b8b)
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: const BorderSide(
        color: Color(0xFF326ec8)
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: const BorderSide(
        color: Color(0xffed5565),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadius),
      borderSide: const BorderSide(
        color: Color(0xffed5565),
      ),
    ),
    errorStyle: const TextStyle(
      fontSize: 14,
      color
      : Color(0xffed5565),
    ),
  ),
  textTheme: const TextTheme(
    titleMedium:  TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color:  Color(0xff242424),
    ),
    displaySmall:TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color:  Color(0xff242424),
    ),
    labelLarge : TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color:  Color(0xff242424),
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: Color(0xff242424),
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: Color(0xFFABABAB),
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color:  Color(0xff242424),
    ),
  ),
);

class StatusColors {
  StatusColors._();

  static const Color success = Color(0xff0661F1);
  static const Color warning = Color(0xffff9f43);
  static const Color error = Color(0xffed5565);

}