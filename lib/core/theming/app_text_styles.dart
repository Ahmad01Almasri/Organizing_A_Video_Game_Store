import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_font_weight_helper.dart';
import 'colors.dart';

class AppTextStyles {
  static TextStyle font24BlackBold = const TextStyle(
    fontSize: 24,
    fontWeight: AppFontWeight.bold,
    color: Colors.black,
  );

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.black,
  );

  static TextStyle font35BlackBold = TextStyle(
    fontSize: 35.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle font16graySemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.primaryColor,
  );

  static TextStyle font16grayBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.gray,
  );

  static TextStyle font17WhiteMedium = TextStyle(
    fontSize: 17.sp,
    fontWeight: AppFontWeight.medium,
    color: Colors.white,
  );

  static TextStyle font15DarkBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle font18graySemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.gray,
  );

  static TextStyle font18DarkBlueSemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.darkBlue,
  );

  static TextStyle font18WhiteMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.medium,
    color: Colors.white,
  );
  static TextStyle font18PrimaryBold = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle font14WhiteW600 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font12RedW600 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.red.withOpacity(0.7),
  );

  static TextStyle font16WhiteBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle font15BlackW600 = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.black38,
  );
  static TextStyle font15PrimaryColorW600 = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static TextStyle font22BlackW600 = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
}
