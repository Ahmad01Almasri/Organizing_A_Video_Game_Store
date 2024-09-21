import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/models/device_model.dart';
import '../../../cubits/device/device_cubit.dart';

class SaveAddItemButton extends StatelessWidget {
  final TextEditingController nameDeviceController;
  final TextEditingController typeDeviceController;
  final TextEditingController priceHourDeviceController;
  final GlobalKey<FormState> formstate;
  final DeviceCubit deviceCubit;
  const SaveAddItemButton({
    super.key,
    required this.deviceCubit,
    required this.nameDeviceController,
    required this.typeDeviceController,
    required this.priceHourDeviceController,
    required this.formstate,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      onPressed: () {
        if (formstate.currentState!.validate()) {
          final device = DeviceModel(
            name: nameDeviceController.text,
            type: typeDeviceController.text,
            price: priceHourDeviceController.text,
            isAvailable: true,
          );
          deviceCubit.addDevice(device);

          Navigator.pop(context);
        }
      },
      color: AppColors.primaryColor,
      child: Text(
        S.of(context).save,
        style: AppTextStyles.font17WhiteMedium,
      ),
    );
  }
}
