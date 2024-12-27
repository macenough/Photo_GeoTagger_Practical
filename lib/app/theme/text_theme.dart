import 'package:flutter/material.dart';

import '../config/app_constants.dart';

TextTheme textTheme(
    {required Color textColor,
    FontWeight fontWeight = FontWeight.w400,
    String fontFamily = AppConstants.montserratRegular}) {
  return TextTheme(
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 17,
      fontWeight: fontWeight,
      color: textColor,
    ),
    //Headers TextStyle
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: fontWeight,
      color: textColor,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: fontWeight,
      color: textColor,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: fontWeight,
      color: textColor,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: fontWeight,
      color: textColor,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: fontWeight,
      color: textColor,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 15,
      fontWeight: fontWeight,
      color: textColor,
    ),
  );
}
