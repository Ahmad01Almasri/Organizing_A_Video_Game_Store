import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/features/home/presentation/cubit/device_cubit.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/device_model.dart';
import '../../../data/models/submodel/customer_model.dart';
import '../../../data/sources/local_device_data_source.dart';
import '../../cubit/device_state.dart';
import 'details_session_bottom_sheet.dart';

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
  // void startTimer() {
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     print(timer.tick);
  //     setState(() {
  //       counter++;
  //       widget.device.customer?.usageTime = counter;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      onPressed: () async {
        if (widget.formstate.currentState!.validate()) {
          if (selectedTime != null) {
            customerName = widget.customerNameController.text;

            if (customerName.isNotEmpty) {
              final customer = CustomerModel.create(
                name: customerName,
              );

              widget.device.setCustomer(customer);
              context
                  .read<DeviceCubit>()
                  .toggleDeviceAvailability(widget.device);

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
