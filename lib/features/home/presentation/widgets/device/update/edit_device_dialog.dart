import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/theming/colors.dart';
import 'package:game_store/core/theming/styles.dart';
import 'package:game_store/features/home/data/models/device_model.dart';
import 'package:game_store/features/home/presentation/cubit/device_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../core/helpers/app_constants.dart';
import '../../../../../../core/helpers/app_functions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

class EditDeviceDialog extends StatefulWidget {
  final DeviceModel device;

  const EditDeviceDialog({
    super.key,
    required this.device,
  });

  @override
  _EditDeviceDialogState createState() => _EditDeviceDialogState();
}

class _EditDeviceDialogState extends State<EditDeviceDialog> {
  late final TextEditingController nameDeviceController;
  late final TextEditingController typeDeviceController;
  late final TextEditingController priceHourDeviceController;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    nameDeviceController = TextEditingController(text: widget.device.name);
    typeDeviceController = TextEditingController(text: widget.device.type);
    priceHourDeviceController =
        TextEditingController(text: widget.device.price);
  }

  @override
  void dispose() {
    nameDeviceController.dispose();
    typeDeviceController.dispose();
    priceHourDeviceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String selectedDevice = widget.device.type;
    return AlertDialog(
      title: Center(
          child: Text(S.of(context).edit_item,
              style: AppTextStyles.font24BlackBold)),
      content: Form(
        key: formstate,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextForm(
              labelText: S.of(context).device_name,
              controller: nameDeviceController,
              validator: (text) {
                return AppFunctions.validationNotEmpty(context, text);
              },
            ),
            verticalSpace(15),
            CustomTextForm(
              readOnly: true,
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                    left: AppFunctions.isLanguageArabic() ? 10.h : 0,
                    right: AppFunctions.isLanguageArabic() ? 0 : 10.h),
                child: DropdownButton<String>(
                  items: AppConstants.deviceName(context).map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: AppTextStyles.font15PrimaryColorW600
                            .copyWith(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDevice = value!;
                      typeDeviceController.text = selectedDevice;
                    });
                  },
                ),
              ),
              labelText: S.of(context).device_type,
              controller: typeDeviceController,
            ),
            verticalSpace(15),
            CustomTextForm(
              labelText: S.of(context).hourly_rate,
              controller: priceHourDeviceController,
              keyboardType: TextInputType.number,
              validator: (text) {
                return AppFunctions.validationNotEmpty(context, text);
              },
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black38.withOpacity(0.7)),
              child: Text(S.of(context).cancel,
                  style: AppTextStyles.font14WhiteW600
                      .copyWith(color: AppColors.red)),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formstate.currentState!.validate()) {
                  final updatedDevice = widget.device;
                  updatedDevice.name = nameDeviceController.text;
                  updatedDevice.type = typeDeviceController.text;
                  updatedDevice.price = priceHourDeviceController.text;
                  updatedDevice.isAvailable = true;

                  var deviceBox = Hive.box<DeviceModel>('devicesBox');
                  if (updatedDevice.isInBox) {
                    await updatedDevice.save();
                  } else {
                    await deviceBox.put(updatedDevice.key, updatedDevice);
                  }

                  context.read<DeviceCubit>().updateDevice(updatedDevice);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black38.withOpacity(0.7)),
              child: Text(S.of(context).save,
                  style: AppTextStyles.font14WhiteW600
                      .copyWith(color: AppColors.green)),
            ),
          ],
        ),
      ],
    );
  }
}
