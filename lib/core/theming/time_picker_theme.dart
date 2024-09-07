import 'package:flutter/material.dart';

import 'colors.dart';
import 'styles.dart';

class MyThemeTimePicker extends StatelessWidget {
  final Widget? child;
  const MyThemeTimePicker({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: AppColors
              .white, // Set the color of the selected time and OK button (main color)
        ),
        buttonTheme: const ButtonThemeData(
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryColor, // OK button background color
          ),
        ),
        timePickerTheme: TimePickerThemeData(
          helpTextStyle: AppTextStyles.font24BlackBold,
          cancelButtonStyle: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              AppTextStyles.poppinsBoldstyle18.copyWith(color: AppColors.black),
            ),
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.primaryColor),
          ),
          confirmButtonStyle: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              AppTextStyles.poppinsBoldstyle18.copyWith(color: AppColors.black),
            ),
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.primaryColor),
          ),
          dialHandColor: AppColors.primaryColor, // Hand color
          dialBackgroundColor: Colors.white, // Background color of the dial
          hourMinuteTextColor: AppColors.white, // Color of the hour/minute text
          entryModeIconColor: AppColors.primaryColor,
          hourMinuteColor: AppColors.primaryColor,
          // Color of the hour/minute text
          dayPeriodColor: AppColors.primaryColor,
        ),
      ),
      child: child!,
    );
  }
}
