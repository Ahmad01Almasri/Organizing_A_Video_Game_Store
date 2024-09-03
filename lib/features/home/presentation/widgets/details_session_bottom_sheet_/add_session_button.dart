import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/device_model.dart';
import '../../../data/models/submodel/customer_model.dart';
import '../../../data/sources/local_device_data_source.dart';
import 'details_session_bottom_sheet.dart';

class AddSessionButton extends StatelessWidget {
  const AddSessionButton({
    super.key,
    required this.formstate,
    required this.customerNameController,
    required this.customerTimeController,
    required this.device,
  });

  final GlobalKey<FormState> formstate;
  final TextEditingController customerNameController;
  final TextEditingController customerTimeController;
  final DeviceModel device;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      onPressed: () async {
        if (formstate.currentState!.validate()) {
          device.isAvailable = !device.isAvailable;
          device.save();

          if (selectedTime != null) {
            final now = DateTime.now();
            final selectedDateTime = DateTime(
              now.year,
              now.month,
              now.day,
              selectedTime!.hour,
              selectedTime!.minute,
            );

            // حساب الوقت المنقضي
            final elapsedDuration = now.difference(selectedDateTime);
            final hours = elapsedDuration.inHours;
            final minutes = elapsedDuration.inMinutes.remainder(60);

            // تحديث customerTimeController بالوقت المنقضي
            customerTimeController.text = '$hours ساعات و $minutes دقائق';
            // تخزين اسم الزبون
            customerName = customerNameController.text;

            if (customerName.isNotEmpty) {
              final customer = CustomerModel.create(
                name: customerName,
                usageTime: selectedDateTime.add(elapsedDuration),
              );

              device.setCustomer(customer);

              // حفظ الجهاز المحدث
              LocalDeviceDataSource.updateDevice(device: device);

              // إغلاق الـ BottomSheet
              Navigator.pop(context);
            }
          }
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
