import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/helpers/spacing.dart';

import 'form_add_item.dart';
import 'save_add_item_button.dart';

String selectedDevice = "";
Future<dynamic> showAddDeviceBottomSheet(
  BuildContext context,
) {
  final nameDeviceTextController = TextEditingController();
  final typeDeviceTextController = TextEditingController();
  final priceHourDeviceTextController = TextEditingController();

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) => Padding(
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
                FormTextFieldAddItem(
                  selectedDevice: selectedDevice,
                  nameDeviceController: nameDeviceTextController,
                  typeDeviceController: typeDeviceTextController,
                  priceHourDeviceController: priceHourDeviceTextController,
                ),
                verticalSpace(30),
                SaveAddItemButton(
                  formstate: formstate,
                  nameDeviceController: nameDeviceTextController,
                  typeDeviceController: typeDeviceTextController,
                  priceHourDeviceController: priceHourDeviceTextController,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
