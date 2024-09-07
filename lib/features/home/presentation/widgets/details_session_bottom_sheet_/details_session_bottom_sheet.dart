import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/helpers/spacing.dart';
import 'package:game_store/features/home/data/models/device_model.dart';
import 'package:game_store/features/home/presentation/cubit/device_cubit.dart';
import 'add_session_button.dart';
import 'form_detailss_session.dart';
import 'row_action_details_session_bottom_sheet.dart';

TimeOfDay? selectedTime = null;
String customerName = "";
Future<void> showDetailsSessionBottomSheet(
    BuildContext context, bool isAvailable, DeviceModel device) async {
  final customerNameController =
      TextEditingController(text: device.customer?.name ?? "");

  // تحويل الوقت إلى النص المعروض
  final customerTimeController = TextEditingController(
    text: device.customer?.createdAt != null
        ? context.read<DeviceCubit>().getCustomerDuration(device.customer)
        : '0',
  );

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) => Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              FormTextDetailsSession(
                isAvailable: device.isAvailable,
                formstate: formstate,
                customerNameController: customerNameController,
                customerTimeController: customerTimeController,
              ),
              verticalSpace(30),
              isAvailable
                  ? AddSessionButton(
                      formstate: formstate,
                      customerNameController: customerNameController,
                      device: device,
                    )
                  : DeletSessionActionButton(
                      device: device,
                    ),
              verticalSpace(290),
            ],
          ),
        ),
      ),
    ),
  );
}
