import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'dialogs/closed_session_dialog.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showClosedSessionDialog(context),
      child: SizedBox(
        height: 88.h,
        child: Card(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 7, top: 7, left: 20, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.laptop_windows_rounded,
                      color: AppColors.gray,
                    ),
                    horizontalSpace(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "لابتوب",
                          style: AppTextStyles.font24BlackBold
                              .copyWith(fontSize: 22.sp),
                        ),
                        Text(
                          "65000 " "ل.س" + "/ " + "ساعة",
                          style: AppTextStyles.font16graySemiBold,
                        ),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  maxRadius: 10.h,
                  backgroundColor: AppColors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
