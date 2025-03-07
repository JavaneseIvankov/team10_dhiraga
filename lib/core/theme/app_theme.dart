import 'package:flutter/material.dart';
import 'package:team10_dhiraga/core/theme/app_color.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    // brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    hintColor: AppColors.grey,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Geist',
        color: AppColors.black,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Geist',
        color: AppColors.black,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Geist',
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Geist',
        color: AppColors.background,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.grey),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.background,
      hintStyle: TextStyle(color: AppColors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.background,
      elevation: 2,
      shadowColor: Colors.black.withAlpha(100), // Soft shadow color
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    dividerColor: AppColors.black,
  );

  // Define custom styles
  static final ButtonStyle primaryButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  );

  static final ButtonStyle secondaryButtonStyle = TextButton.styleFrom(
    backgroundColor: AppColors.secondary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  );

  static final TextStyle primaryTextStyle = TextStyle(
    fontFamily: 'Geist',
    color: AppColors.primary,
    fontSize: 16,
  );

  static final TextStyle secondaryTextStyle = TextStyle(
    fontFamily: 'Geist',
    color: AppColors.secondary,
    fontSize: 16,
  );
}
