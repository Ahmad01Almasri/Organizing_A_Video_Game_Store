import 'package:flutter/material.dart';
import '../../../../../core/helpers/app_constants.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widget/custom_text_field.dart';

class FormTextFieldAddItem extends StatefulWidget {
  String selectedDevice;
  final TextEditingController nameDeviceTextController;
  final TextEditingController typeDeviceTextController;
  final TextEditingController priceHourDeviceTextController;

  FormTextFieldAddItem({
    Key? key,
    required this.selectedDevice,
    required this.nameDeviceTextController,
    required this.typeDeviceTextController,
    required this.priceHourDeviceTextController,
  }) : super(key: key);

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
          labelText: "اسم الجهاز",
          controller: widget.nameDeviceTextController,
          focusNode: _nameFocusNode,
          validator: (text) {
            return AppConstants.validationNotEmpty(text);
          },
        ),
        verticalSpace(15),
        CustomTextForm(
          readOnly: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: DropdownButton<String>(
              items: AppConstants.deviceName.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style:
                        AppTextStyles.poppinsW500style15.copyWith(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.selectedDevice = value!;
                  widget.typeDeviceTextController.text = widget.selectedDevice;
                });
              },
            ),
          ),
          labelText: "نوع الجهاز",
          controller: widget.typeDeviceTextController,
        ),
        verticalSpace(15),
        CustomTextForm(
          labelText: "سعر الساعة",
          controller: widget.priceHourDeviceTextController,
          keyboardType: TextInputType.number,
          validator: (text) {
            return AppConstants.validationNotEmpty(text);
          },
        ),
      ],
    );
  }
}
