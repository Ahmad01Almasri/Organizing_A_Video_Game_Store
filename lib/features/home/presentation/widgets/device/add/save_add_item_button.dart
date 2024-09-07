import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/models/device_model.dart';
import '../../../cubit/device_cubit.dart';

class SaveAddItemButton extends StatelessWidget {
  final TextEditingController nameDeviceController;
  final TextEditingController typeDeviceController;
  final TextEditingController priceHourDeviceController;
  final GlobalKey<FormState> formstate;

  const SaveAddItemButton({
    super.key,
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
          final device = DeviceModel.create(
            name: nameDeviceController.text,
            type: typeDeviceController.text,
            price: priceHourDeviceController.text,
            isAvailable: true,
          );
          context.read<DeviceCubit>().addDevice(device);

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
