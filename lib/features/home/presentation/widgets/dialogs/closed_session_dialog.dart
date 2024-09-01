import 'package:flutter/material.dart';
import 'package:game_store/core/theming/colors.dart';
import 'package:game_store/core/theming/styles.dart';

Future<void> showClosedSessionDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Text(
          "تم إغلاق الجلسة",
          style: AppTextStyles.font24BlackBold,
        ),
        content: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'حساب الزبون : ', style: AppTextStyles.font16grayBold),
              TextSpan(
                  text: ' 3500 ',
                  style: AppTextStyles.font16grayBold
                      .copyWith(color: AppColors.primaryColor)),
              TextSpan(
                  text: 'ل.س',
                  style: AppTextStyles.font16grayBold
                      .copyWith(color: AppColors.primaryColor)),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            height: 40,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: AppColors.grey,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "إغلاق",
              style: AppTextStyles.font15DarkBold,
            ),
          )
        ],
      ),
    ),
  );
}