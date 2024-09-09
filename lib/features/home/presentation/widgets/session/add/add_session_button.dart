import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/features/home/presentation/cubit/device_cubit.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
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
  });

  final GlobalKey<FormState> formstate;
  final TextEditingController customerNameController;
  final DeviceModel device;

  @override
  _AddSessionButtonState createState() => _AddSessionButtonState();
}

class _AddSessionButtonState extends State<AddSessionButton> {
  int counter = 0;
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
            // Schedule notification
            //       await NotificationService().scheduleNotification(
            //     dateTime: DateTime.now().add(Duration(seconds: 120)),
            //     id: 1,
            //     title: "إشعار مجدول",
            //     body: "تم إرسال الإشعار بعد 120 ثانية");
            // print(DateTime.now());
            selectedDateTime = DateTime(selectedTime!.minute);
          }
          customerName = widget.customerNameController.text;

          if (customerName.isNotEmpty) {
            final customer = CustomerModel.create(
              selectedTime: selectedDateTime,
              name: customerName,
            );

            widget.device.setCustomer(customer);
            context.read<DeviceCubit>().toggleDeviceAvailability(widget.device);

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
