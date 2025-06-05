import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorConstant.white,
    primaryColor: ColorConstant.appBlue,
    cardColor: ColorConstant.cardColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConstant.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstant.white,
      foregroundColor: ColorConstant.black,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorConstant.black),
      bodyMedium: TextStyle(color: ColorConstant.black),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorConstant.white,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorConstant.black,
    primaryColor: ColorConstant.appBlue,
    cardColor: ColorConstant.grey,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConstant.grey,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstant.black,
      foregroundColor: ColorConstant.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorConstant.white),
      bodyMedium: TextStyle(color: ColorConstant.white),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorConstant.black,
    ),
  );
}
