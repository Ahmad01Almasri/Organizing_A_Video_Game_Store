import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/features/home/presentation/cubits/device/device_cubit.dart';
import '../../../../../../core/services/notification_services.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/models/device_model.dart';
import '../../../../data/models/customer_model.dart';
import '../details/details_session_bottom_sheet.dart';

class AddSessionButton extends StatefulWidget {
  const AddSessionButton({
    super.key,
    required this.formstate,
    required this.customerNameController,
    required this.device,
    required this.deviceCubit,
    required this.priceController, // تمرير التحكم بالسعر
  });

  final GlobalKey<FormState> formstate;
  final TextEditingController customerNameController;
  final DeviceModel device;
  final DeviceCubit deviceCubit;
  final TextEditingController priceController; // التحكم بحقل السعر
  @override
  _AddSessionButtonState createState() => _AddSessionButtonState();
}

class _AddSessionButtonState extends State<AddSessionButton> {
  void setAlarmExample() async {
    // حدد وقت المنبه
    DateTime alarmTime =
        DateTime.now().add(Duration(seconds: 10)); // بعد 10 ثوانٍ

    // استدعاء دالة ضبط المنبه
    await NotificationService().scheduleAlarm(
      alarmName: "الاستيقاظ",
      alarmTime: alarmTime,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50.h,
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      onPressed: () async {
        if (widget.formstate.currentState!.validate()) {
          DateTime? selectedDateTime;
          if (selectedTime != null) {
            print("{::::::::::::::::::::::::::::::$selectedTime}");
            selectedDateTime = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                selectedTime!.hour,
                selectedTime!.minute);
            print("{::::::::::::::::::::::::::::::$selectedDateTime}");

            selectedDateTime = DateTime(selectedTime!.minute);
          }
          customerName = widget.customerNameController.text;
          final price = int.tryParse(widget.priceController.text) ?? 0;

          if (customerName.isNotEmpty) {
            final customer = CustomerModel(
              selectedTime: selectedDateTime,
              name: customerName,
              prices: [price],
            );

            await widget.device.setCustomer(customer);
            await widget.deviceCubit.toggleDeviceAvailability(widget.device);

            Navigator.pop(context);
          }
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
