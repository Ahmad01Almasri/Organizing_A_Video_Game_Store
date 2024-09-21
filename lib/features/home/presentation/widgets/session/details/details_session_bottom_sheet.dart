import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/helpers/spacing.dart';
import 'package:game_store/features/home/data/models/device_model.dart';
import 'package:game_store/features/home/presentation/cubits/device/device_cubit.dart';
import '../add/add_session_button.dart';
import 'form_detailss_session.dart';
import 'row_action_details_session_bottom_sheet.dart';

TimeOfDay? selectedTime = null;
String customerName = "";
Future<dynamic> showDetailsSessionBottomSheet(BuildContext context,
    bool isAvailable, DeviceModel device, DeviceCubit deviceCubit) {
  final customerNameController =
      TextEditingController(text: device.customer?.name ?? "");

  final customerTimeController = TextEditingController(
    text: device.customer?.createdAt != null
        ? context.read<DeviceCubit>().getCustomerDuration(device.customer)
        : '0',
  );

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.w,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 300.h : 30.h,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
              key: formstate,
              child: Column(
                children: [
                  FormTextDetailsSession(
                    isAvailable: device.isAvailable,
                    customerNameController: customerNameController,
                    customerTimeController: customerTimeController,
                  ),
                  verticalSpace(30),
                  isAvailable
                      ? AddSessionButton(
                          deviceCubit: deviceCubit,
                          formstate: formstate,
                          customerNameController: customerNameController,
                          device: device,
                        )
                      : DeletSessionActionButton(
                          deviceCubit: deviceCubit,
                          device: device,
                        ),
                  verticalSpace(30),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
