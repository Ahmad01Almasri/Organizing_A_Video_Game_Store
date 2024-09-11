import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/theming/colors.dart';
import '../../../../../../core/helpers/app_constants.dart';
import '../../../../../../core/helpers/app_functions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';

// ignore: must_be_immutable
class FormTextFieldAddItem extends StatefulWidget {
  String selectedDevice;
  final TextEditingController nameDeviceController;
  final TextEditingController typeDeviceController;
  final TextEditingController priceHourDeviceController;

  FormTextFieldAddItem({
    super.key,
    required this.selectedDevice,
    required this.nameDeviceController,
    required this.typeDeviceController,
    required this.priceHourDeviceController,
  });

  @override
  _FormTextFieldAddItemState createState() => _FormTextFieldAddItemState();
}

class _FormTextFieldAddItemState extends State<FormTextFieldAddItem> {
  late FocusNode _nameFocusNode;
  String? _selectedDevice;
  void showSelectDeviceTypeDialog(BuildContext context) {
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
                      Icon(
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
                      widget.typeDeviceController.text = _selectedDevice!;
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
    _nameFocusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_nameFocusNode);
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    widget.nameDeviceController.dispose();
    widget.typeDeviceController.dispose();
    widget.priceHourDeviceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          labelText: S.of(context).device_name,
          controller: widget.nameDeviceController,
          focusNode: _nameFocusNode,
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
            child: Icon(Icons.arrow_drop_down),
          ),
          labelText: S.of(context).device_type,
          controller: widget.typeDeviceController,
        ),
        verticalSpace(15),
        CustomTextForm(
          labelText: S.of(context).hourly_rate,
          controller: widget.priceHourDeviceController,
          keyboardType: TextInputType.number,
          validator: (text) {
            return AppFunctions.validationNotEmpty(context, text);
          },
        ),
      ],
    );
  }
}
