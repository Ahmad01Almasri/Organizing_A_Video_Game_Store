import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/injection_container.dart' as di;

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/device_model.dart';
import '../../cubit/device_cubit.dart';

class SaveAddItemButton extends StatefulWidget {
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
  State<SaveAddItemButton> createState() => _SaveAddItemButtonState();
}

class _SaveAddItemButtonState extends State<SaveAddItemButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      onPressed: () {
        if (widget.formstate.currentState!.validate()) {
          final device = DeviceModel.create(
            name: widget.nameDeviceController.text,
            type: widget.typeDeviceController.text,
            price: widget.priceHourDeviceController.text,
            isAvailable: true,
          );
          context.read<DeviceCubit>().addDevice(device);

          Navigator.pop(context);
        }
      },
      color: AppColors.primaryColor,
      child: Text(
        "حفظ",
        style: AppTextStyles.font17WhiteMedium,
      ),
    );
  }
}
