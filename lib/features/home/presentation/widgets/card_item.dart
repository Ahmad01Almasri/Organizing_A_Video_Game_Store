import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'details_session_bottom_sheet_/details_session_bottom_sheet.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onPressed: (context) {
              // Add delete functionality here
              // showDeleteCommentConfirmationDialog(
              //   context,
              // commentId,
              // );
            },
            backgroundColor: AppColors.redShade100,
            child: const Icon(Icons.delete, color: AppColors.red),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onPressed: (context) {
              // Add edit functionality here
              // For example, show an edit dialog
              // showEditCommentDialog(context, commentText, commentId);
            },
            backgroundColor: AppColors.amberShade100,
            child: SizedBox(
              height: 40.h,
              child: const Icon(Icons.edit, color: AppColors.amber),
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => showDetailsSessionBottomSheet(context),
        child: SizedBox(
          height: 88.h,
          child: Card(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 7.h,
                top: 7.h,
                left: 20.w,
                right: 14.w,
              ),
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
                            style: AppTextStyles.font16graySemiBold
                                .copyWith(color: AppColors.gray),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    maxRadius: 10.h,
                    backgroundColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
