import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/theming/colors.dart';
import 'package:game_store/core/theming/styles.dart';
import 'package:game_store/features/home/data/models/device_model.dart';

import '../../../../../../core/helpers/app_constants.dart';
import '../../../../../../core/helpers/app_functions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../../cubit/device_cubit.dart';
import 'row_action_button.dart';

class EditDeviceDialog extends StatefulWidget {
  final DeviceModel device;
  final DeviceCubit deviceCubit;
  const EditDeviceDialog({
    super.key,
    required this.device,
    required this.deviceCubit,
  });

  @override
  _EditDeviceDialogState createState() => _EditDeviceDialogState();
}

class _EditDeviceDialogState extends State<EditDeviceDialog> {
  late final TextEditingController nameDeviceController;
  late final TextEditingController typeDeviceController;
  late final TextEditingController priceHourDeviceController;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  void showSelectDeviceTypeDialog(BuildContext context) {
    String _selectedDevice = widget.device.type;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titleTextStyle: AppTextStyles.font24BlackBold,
          title: Text(S.of(context).device_type),
          content: SizedBox(
            width: double.maxFinite,
            height: 200.h,
            child: ListView(
              children: AppConstants.deviceName(context).map((item) {
                return ListTile(
                  title: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: AppColors.primaryColor,
                        size: 10,
                      ),
                      horizontalSpace(5),
                      Text(
                        item,
                        style: AppTextStyles.font15PrimaryColorW600
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _selectedDevice = item;
                      typeDeviceController.text = _selectedDevice;
                    });
                    Navigator.pop(context); // إغلاق الحوار بعد اختيار العنصر
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

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
              onTap: () {
                showSelectDeviceTypeDialog(context);
              },
              readOnly: true,
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                    left: AppFunctions.isLanguageArabic() ? 10 : 0,
                    right: AppFunctions.isLanguageArabic() ? 0 : 16),
                child: const Icon(Icons.arrow_drop_down),
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
        RowActionButtonEditDialog(
            deviceCubit: widget.deviceCubit,
            formstate: formstate,
            widget: widget,
            nameDeviceController: nameDeviceController,
            typeDeviceController: typeDeviceController,
            priceHourDeviceController: priceHourDeviceController),
      ],
    );
  }
}
