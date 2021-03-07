
import 'package:flutter/material.dart';
import 'package:molteo_books/style/colors.dart';
import 'package:molteo_books/style/style.dart';

class MbThemes {
  static final base = ThemeData.light();
  static final ThemeData defaultTheme = base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    backgroundColor: MbColors.primary,
    scaffoldBackgroundColor: MbColors.primary,
    primaryColor: MbColors.primary,
    accentColor: MbColors.secondary,
    primaryColorBrightness: Brightness.light,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: MbColors.black,
        ),
      ),
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: MbColors.black),
      color: MbColors.white,
      elevation: 0,
    ),
    dividerColor: MbColors.black.withOpacity(.3),
    bottomAppBarColor: MbColors.purple,
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      elevation: 0,
      color: MbColors.purple,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      buttonColor: MbColors.purple,
      disabledColor: MbColors.purple.withOpacity(.5),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: MbColors.purple,
      foregroundColor: Colors.white,
    ),
    cardColor: MbColors.white,
    textSelectionColor: MbColors.purple.withOpacity(.3),
    errorColor: MbColors.red,
    textTheme: base.textTheme.apply(
      displayColor: MbColors.black,
      bodyColor: MbColors.black,
      fontFamily: MbFonts.bellota,
    ),
    dialogTheme: base.dialogTheme.copyWith(),
    indicatorColor: MbColors.purple,
    textSelectionHandleColor: MbColors.purple,
    cursorColor: MbColors.purple,
    iconTheme: base.iconTheme.copyWith(
      color: MbColors.black,
      size: 30,
    ),
  );
}
