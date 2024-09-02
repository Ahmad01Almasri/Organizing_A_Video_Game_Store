import 'package:flutter/material.dart';
import 'package:game_store/features/home/presentation/widgets/add_device_bottom_sheet/add_device_bottom_sheet.dart';
import 'package:game_store/features/home/presentation/widgets/add_device_bottom_sheet/form_add_item.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

void showEditItemDialog(
    BuildContext context,
    String oldNameDeviceController,
    String oldTypeDeviceController,
    String oldpriceHourDeviceController,
    String commentId) async {
  TextEditingController nameDeviceController =
      TextEditingController(text: oldNameDeviceController);
  TextEditingController typeDeviceController =
      TextEditingController(text: oldTypeDeviceController);
  TextEditingController priceHourDeviceController =
      TextEditingController(text: oldpriceHourDeviceController);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child:
                Text('تعديل العنصر', style: AppTextStyles.poppinsBoldstyle24)),
        content: FormTextFieldAddItem(
          selectedDevice: selectedDevice,
          nameDeviceController: nameDeviceController,
          priceHourDeviceController: priceHourDeviceController,
          typeDeviceController: typeDeviceController,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black38.withOpacity(0.7)),
                child: Text('Cancel',
                    style: AppTextStyles.poppinsw600style14
                        .copyWith(color: AppColors.red)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black38.withOpacity(0.7)),
                child: Text('Save',
                    style: AppTextStyles.poppinsw600style14
                        .copyWith(color: AppColors.green)),
              ),
            ],
          ),
        ],
      );
    },
  );
}
