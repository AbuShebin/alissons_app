import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Palette.primaryColor,
      onPrimary: Palette.whiteColor,
      secondary: Palette.primaryColor,
      onSecondary: Palette.blackColor,
      error: Palette.snackBarErrorColor,
      onError: Palette.whiteColor,
      surface: Palette.surfaceColor,
      onSurface: Palette.blackColor,
    ),
    scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
    iconTheme: IconThemeData(color: Palette.primaryColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
  elevation: 6,
  highlightElevation: 12,
),
fontFamily: "Lufga"
  );
}
