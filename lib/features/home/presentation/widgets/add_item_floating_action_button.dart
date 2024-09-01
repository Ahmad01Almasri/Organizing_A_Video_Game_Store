import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import 'bottom_sheet/add_device_bottom_sheet.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      onPressed: () => showAddDeviceBottomSheet(context),
      child: const Icon(Icons.add), // Added an icon for clarity.
    );
  }
}
