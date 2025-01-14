import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_functions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/device_model.dart';
import '../../cubits/device/device_cubit.dart';
import '../session/details/details_session_bottom_sheet.dart';
import 'slidable_card_device.dart';

class CardDevice extends StatelessWidget {
  final DeviceModel device;
  final int index;
  final DeviceCubit deviceCubit;

  const CardDevice({
    super.key,
    required this.device,
    required this.index,
    required this.deviceCubit,
  });

  @override
  Widget build(BuildContext context) {
    return device.isAvailable
        ? SlidableCardItem(
            device: device,
            deviceCubit: deviceCubit,
          )
        : GestureDetector(
            onTap: () => showDetailsSessionBottomSheet(
                context, false, device, deviceCubit),
            child: SizedBox(
              height: 90.h,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 7.h,
                      top: 7.h,
                      left: AppFunctions.isLanguageArabic() ? 20.h : 14.h,
                      right: AppFunctions.isLanguageArabic() ? 14.h : 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          device.type == "laptop"
                              ? const Icon(
                                  Icons.laptop_windows_rounded,
                                  color: AppColors.gray,
                                )
                              : device.type == "computer"
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
                                "${device.price}${S.of(context).currency}/ ${S.of(context).hour}",
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
                            ? AppColors.green
                            : AppColors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
