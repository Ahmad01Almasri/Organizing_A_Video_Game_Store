import 'package:flutter/material.dart';
import 'package:game_store/core/theming/styles.dart';

import 'colors.dart';

class AppThemeData {
  static TimePickerThemeData mytimePickerThemeData = TimePickerThemeData(
    helpTextStyle: AppTextStyles.font24BlackBold,
    cancelButtonStyle: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        AppTextStyles.poppinsBoldstyle18.copyWith(color: AppColors.black),
      ),
      backgroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
    ),
    confirmButtonStyle: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        AppTextStyles.poppinsBoldstyle18.copyWith(color: AppColors.black),
      ),
      backgroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
    ),
    dialHandColor: AppColors.primaryColor, // Hand color
    dialBackgroundColor: Colors.white, // Background color of the dial
    hourMinuteTextColor: AppColors.white, // Color of the hour/minute text
    entryModeIconColor: AppColors.primaryColor,
    hourMinuteColor: AppColors.primaryColor,
    // Color of the hour/minute text
    dayPeriodColor: AppColors.primaryColor,
  );
}
