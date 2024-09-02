import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:game_store/features/home/data/models/device_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'details_session_bottom_sheet_/details_session_bottom_sheet.dart';
import 'dialogs/edit_item_dialog.dart';

class CardItem extends StatelessWidget {
  final DeviceModel device;
  CardItem({
    super.key,
    required this.device,
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
              // showEditItemDialog(
              //   context,
              // );
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
                      device.type == "لابتوب"
                          ? const Icon(
                              Icons.laptop_windows_rounded,
                              color: AppColors.gray,
                            )
                          : device.type == "حاسب"
                              ? const Icon(
                                  Icons.desktop_windows_rounded,
                                  color: AppColors.gray,
                                )
                              : const Icon(
                                  Icons.gamepad_outlined,
                                  color: AppColors.gray,
                                ),
                      horizontalSpace(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            device.name,
                            style: AppTextStyles.font24BlackBold
                                .copyWith(fontSize: 22.sp),
                          ),
                          Text(
                            device.price + "ل.س" + "/ " + "ساعة",
                            style: AppTextStyles.font16graySemiBold
                                .copyWith(color: AppColors.gray),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    maxRadius: 10.h,
                    backgroundColor: device.isAvailable
                        ? AppColors.primaryColor
                        : AppColors.red,
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
