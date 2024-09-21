import 'package:flutter/material.dart';
import 'package:game_store/core/theming/app_text_styles.dart';
import 'app_colors.dart';

class AppThemeData {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: AppColors
            .white, // Set the color of the selected time and OK button (main color)
      ),
      buttonTheme: const ButtonThemeData(
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor, // OK button background color
        ),
      ),
      timePickerTheme: mytimePickerThemeData,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primaryColor,
      ),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.white,
    );
  }

  static TimePickerThemeData mytimePickerThemeData = TimePickerThemeData(
    helpTextStyle: AppTextStyles.font24BlackBold,
    cancelButtonStyle: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        AppTextStyles.font18PrimaryBold.copyWith(color: AppColors.black),
      ),
      backgroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
    ),
    confirmButtonStyle: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        AppTextStyles.font18PrimaryBold.copyWith(color: AppColors.black),
      ),
      backgroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
    ),
    dialHandColor: AppColors.primaryColor, // Hand color
    dialBackgroundColor: Colors.white, // Background color of the dial
    hourMinuteTextColor: AppColors.white, // Color of the hour/minute text
    entryModeIconColor: AppColors.primaryColor,
    hourMinuteColor: AppColors.primaryColor, // Color of the hour/minute text
    dayPeriodColor: AppColors.primaryColor,
  );
}
