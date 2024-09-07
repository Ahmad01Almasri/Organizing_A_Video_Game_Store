import 'package:flutter/material.dart';

import '../../../../../../core/theming/colors.dart';
import '../../device/add/add_device_bottom_sheet.dart';

class AddDeviceButton extends StatelessWidget {
  const AddDeviceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      onPressed: () => showAddDeviceBottomSheet(
        context,
      ),
      child: const Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
  }
}
