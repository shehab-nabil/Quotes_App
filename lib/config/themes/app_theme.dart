import 'package:flutter/material.dart';
import 'package:quotes_app/core/utils/app_colors.dart';
import 'package:quotes_app/core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hintColor,
    fontFamily: AppStrings.fontFamily,
    scaffoldBackgroundColor: Colors.white,
    //AppBar
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    ),
    //Icon Button
    // iconButtonTheme: const IconButtonThemeData(
    //     style: ButtonStyle(iconColor: MaterialState(Colors.black))),
  );
}
