import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/helpers/spacing.dart';
import 'package:game_store/core/theming/styles.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widget/custom_text_field.dart';
import '../dialogs/select_time_dialogs.dart';

List<String> cityName = [
  'لابتوب',
  'بلايستيشن',
  'حاسب',
];
String selectedCity = '';
final nameDeviceTextController = TextEditingController();
final typeDeviceTextController = TextEditingController();
final priceHourDeviceTextController = TextEditingController();
//validation name and price device
String? validationNameAndPrice(String? value) {
  if ((value ?? '').isEmpty) return "لا يمكن ترك الحقل فارغ";
  return null;
}

Future<dynamic> showAddDeviceBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) => Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Form(
            child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              CustomTextForm(
                labelText: "اسم الجهاز",
                controller: nameDeviceTextController,
                validator: (text) {
                  return validationNameAndPrice(text);
                },
              ),
              verticalSpace(15),
              CustomTextForm(
                readOnly: true,
                suffixIcon: DropdownButton<String>(
                  items: cityName.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: AppTextStyles.poppinsW500style15
                            .copyWith(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedCity = value!;
                    typeDeviceTextController.text = selectedCity;
                  },
                ),
                labelText: "نوع الجهاز",
                controller: typeDeviceTextController,

                // String? result = await selectDeviceTypeDialog(
                //     context); // Wait for dialog result

                // if (result != null) {
                //   selectedCity = result; // Set selected city
                //   typeDeviceTextController.text =
                //       selectedCity; // Update text field with selected city
                // }
              ),
              verticalSpace(15),
              CustomTextForm(
                labelText: "سعر الساعة",
                controller: priceHourDeviceTextController,
                keyboardType: TextInputType.number,
                validator: (text) {
                  return validationNameAndPrice(text);
                },
              ),
              verticalSpace(30),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                onPressed: () {
                  showTimeSelectionDialog(context);
                },
                color: AppColors.primaryColor,
                child: Text(
                  "حفظ",
                  style: AppTextStyles.font17WhiteMedium,
                ),
              ),
              SizedBox(
                height: 300.h,
              )
            ],
          ),
        )),
      ),
    ),
  );
}
