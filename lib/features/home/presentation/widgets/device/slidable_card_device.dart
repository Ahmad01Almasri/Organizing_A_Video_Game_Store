import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../core/helpers/app_functions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/device_model.dart';
import '../session/details/details_session_bottom_sheet.dart';
import 'delete/delet_confirmation_dialog.dart';
import 'update/edit_device_dialog.dart';

class SlidableCardItem extends StatelessWidget {
  const SlidableCardItem({
    super.key,
    required this.device,
  });

  final DeviceModel device;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            onPressed: (context) {
              showDeleteDeviceConfirmationDialog(context, device);
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
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return EditDeviceDialog(
                    device: device,
                  );
                },
              );
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
        onTap: () => showDetailsSessionBottomSheet(context, true, device),
        child: SizedBox(
          height: 90.h,
          child: Card(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 7.h,
                  top: 7.h,
                  left: IsArabic() ? 20.h : 14.h,
                  right: IsArabic() ? 14.h : 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      device.type == S.of(context).laptop
                          ? const Icon(
                              Icons.laptop_windows_rounded,
                              color: AppColors.gray,
                            )
                          : device.type == S.of(context).computer
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
                            device.price + " ل.س" + "/ " + "ساعة",
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