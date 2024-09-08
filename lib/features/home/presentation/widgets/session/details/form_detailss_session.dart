import 'package:flutter/material.dart';
import 'package:game_store/core/theming/colors.dart';
import 'package:game_store/core/theming/styles.dart';
import '../../../../../../core/helpers/app_constants.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../add/select_time_dialogs.dart';
import 'details_session_bottom_sheet.dart';

class FormTextDetailsSession extends StatefulWidget {
  const FormTextDetailsSession({
    super.key,
    required this.customerNameController,
    required this.customerTimeController,
    required this.isAvailable,
  });
  final bool isAvailable;
  final TextEditingController customerNameController;
  final TextEditingController customerTimeController;

  @override
  State<FormTextDetailsSession> createState() => _FormTextDetailsSessionState();
}

class _FormTextDetailsSessionState extends State<FormTextDetailsSession> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextForm(
          labelText: S.of(context).customer_name,
          controller: widget.customerNameController,
          focusNode: _nameFocusNode,
          validator: (text) {
            return AppConstants.validationNotEmpty(context, text);
          },
          readOnly: !widget.isAvailable,
        ),
        verticalSpace(10),
        widget.isAvailable
            ? TextButton(
                onPressed: () async {
                  selectedTime = await showTimeSelectionDialog(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.timer,
                      color: AppColors.primaryColor,
                    ),
                    horizontalSpace(10),
                    Text(
                      S.of(context).set_reminder,
                      style: AppTextStyles.font18DarkBlueSemiBold
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              )
            : CustomTextForm(
                labelText: S.of(context).time,
                controller: widget.customerTimeController,
                readOnly: true,
              ),
      ],
    );
  }
}
