import 'package:flutter/material.dart';
import 'package:game_store/features/home/presentation/cubit/device_cubit.dart';
import '../../../../../../core/theming/colors.dart';
import 'add_device_bottom_sheet.dart';

class AddDeviceButton extends StatelessWidget {
  final DeviceCubit deviceCubit;
  const AddDeviceButton({
    super.key,
    required this.deviceCubit,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      onPressed: () async {
        showAddDeviceBottomSheet(context, deviceCubit);
      },
      child: const Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
  }
}
