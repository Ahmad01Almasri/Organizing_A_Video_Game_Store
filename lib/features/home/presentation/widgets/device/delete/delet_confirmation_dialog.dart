import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/models/device_model.dart';
import '../../../cubits/device/device_cubit.dart';

Future<void> showDeleteDeviceConfirmationDialog(
    BuildContext context, DeviceModel device, DeviceCubit deviceCubit) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          S.of(context).confirm_delete_device,
          style: AppTextStyles.font22BlackW600,
        ),
        content: Text(
          S.of(context).delete_confirmation,
          style:
              AppTextStyles.font18PrimaryBold.copyWith(color: AppColors.black),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        AppColors.black38.withOpacity(0.7))),
                child: Text(S.of(context).cancel,
                    style: AppTextStyles.font16WhiteBold
                        .copyWith(color: AppColors.green)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        AppColors.black38.withOpacity(0.7))),
                child: Text(S.of(context).delete,
                    style: AppTextStyles.font16WhiteBold
                        .copyWith(color: AppColors.red)),
                onPressed: () async {
                  deviceCubit.deleteDevice(device);

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
