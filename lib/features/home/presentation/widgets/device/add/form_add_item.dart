import 'package:flutter/material.dart';
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
          readOnly: true,
          suffixIcon: Padding(
            padding: EdgeInsets.only(
                left: AppFunctions.isLanguageArabic() ? 10 : 0,
                right: AppFunctions.isLanguageArabic() ? 0 : 16),
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
                  widget.selectedDevice = value!;
                  widget.typeDeviceController.text = widget.selectedDevice;
                });
              },
            ),
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
