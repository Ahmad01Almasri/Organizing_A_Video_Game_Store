import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/models/device_model.dart';
import '../../../cubits/device/device_cubit.dart';
import 'edit_device_dialog.dart';

class RowActionButtonEditDialog extends StatelessWidget {
  const RowActionButtonEditDialog({
    super.key,
    required this.formstate,
    required this.widget,
    required this.nameDeviceController,
    required this.typeDeviceController,
    required this.priceHourDeviceController,
    required this.deviceCubit,
  });
  final DeviceCubit deviceCubit;
  final GlobalKey<FormState> formstate;
  final EditDeviceDialog widget;
  final TextEditingController nameDeviceController;
  final TextEditingController typeDeviceController;
  final TextEditingController priceHourDeviceController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black38.withOpacity(0.7)),
          child: Text(S.of(context).cancel,
              style:
                  AppTextStyles.font14WhiteW600.copyWith(color: AppColors.red)),
        ),
        ElevatedButton(
          onPressed: () async {
            if (formstate.currentState!.validate()) {
              final updatedDevice = widget.device;
              updatedDevice.name = nameDeviceController.text;
              updatedDevice.type = typeDeviceController.text;
              updatedDevice.price = priceHourDeviceController.text;
              updatedDevice.isAvailable = true;

              var deviceBox = Hive.box<DeviceModel>('devicesBox');
              if (updatedDevice.isInBox) {
                await updatedDevice.save();
              } else {
                await deviceBox.put(updatedDevice.key, updatedDevice);
              }

              deviceCubit.updateDevice(updatedDevice);
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black38.withOpacity(0.7)),
          child: Text(S.of(context).save,
              style: AppTextStyles.font14WhiteW600
                  .copyWith(color: AppColors.green)),
        ),
      ],
    );
  }
}
