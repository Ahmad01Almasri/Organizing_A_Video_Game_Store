import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/helpers/spacing.dart';

import 'form_add_item.dart';
import 'save_add_item_button.dart';

String selectedDevice = "";
Future<dynamic> showAddDeviceBottomSheet(BuildContext context) {
  final nameDeviceTextController = TextEditingController();
  final typeDeviceTextController = TextEditingController();
  final priceHourDeviceTextController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) => Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Form(
          key: formstate,
          child: Padding(
            padding: EdgeInsets.all(20.w),
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
                verticalSpace(300),
              ],
            ),
          ),
        ),
      ),
    ),
  ).whenComplete(() {
    nameDeviceTextController.clear();
    typeDeviceTextController.clear();
    priceHourDeviceTextController.clear();
    nameFocusNode.dispose();
  });
}
