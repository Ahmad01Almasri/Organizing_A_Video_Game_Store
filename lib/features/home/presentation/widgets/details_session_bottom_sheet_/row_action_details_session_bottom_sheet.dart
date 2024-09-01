import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../dialogs/closed_session_dialog.dart';
import 'action_button.dart';

class RowActionButton extends StatelessWidget {
  const RowActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ActionButton(
            backgroundColor: AppColors.primaryColor,
            textNameButton: "إغلاق الجلسة",
            textNamestyle: AppTextStyles.poppinsBoldstyle16,
            onPressed: () {
              showClosedSessionDialog(context);
            }) // المسافة بين الأزرار
        ,
        horizontalSpace(10),
        ActionButton(
            borderColor: AppColors.red,
            textNameButton: "عودة",
            textNamestyle:
                AppTextStyles.poppinsBoldstyle16.copyWith(color: AppColors.red),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}
