import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/helpers/spacing.dart';
import 'package:game_store/features/home/data/models/device_model.dart';
import 'add_session_button.dart';
import 'form_detailss_session.dart';
import 'row_action_details_session_bottom_sheet.dart';

TimeOfDay? selectedTime = null;
String customerName = "";
Future<void> showDetailsSessionBottomSheet(
    BuildContext context, bool isAvailable, DeviceModel device) async {
  final customerNameController =
      TextEditingController(text: device.customer?.name ?? "");
  final customerTimeController = TextEditingController(
    text: device.customer?.usageTime != null
        ? "${device.customer!.usageTime!.hour.toString().padLeft(2, '0')}:${device.customer!.usageTime!.minute.toString().padLeft(2, '0')}"
        : "",
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
                  customerTimeController: customerTimeController),
              verticalSpace(30),
              isAvailable
                  ? AddSessionButton(
                      formstate: formstate,
                      customerTimeController: customerTimeController,
                      customerNameController: customerNameController,
                      device: device,
                    )
                  : const DeletSessionActionButton(),
              verticalSpace(290),
            ],
          ),
        ),
      ),
    ),
  );
}
