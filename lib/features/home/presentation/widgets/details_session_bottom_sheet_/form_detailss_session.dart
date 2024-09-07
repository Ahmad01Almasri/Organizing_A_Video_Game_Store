import 'package:flutter/material.dart';
import 'package:game_store/core/theming/colors.dart';
import 'package:game_store/core/theming/styles.dart';
import '../../../../../core/helpers/app_constants.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widget/custom_text_field.dart';
import '../dialogs/select_time_dialogs.dart';
import 'details_session_bottom_sheet.dart';

class FormTextDetailsSession extends StatefulWidget {
  const FormTextDetailsSession({
    super.key,
    required this.formstate,
    required this.customerNameController,
    required this.customerTimeController,
    required this.isAvailable,
  });
  final bool isAvailable;
  final GlobalKey<FormState> formstate;
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
    return Form(
      key: widget.formstate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextForm(
            labelText: "اسم الزبون",
            controller: widget.customerNameController,
            validator: (text) {
              return AppConstants.validationNotEmpty(text);
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
                        "ضبط تذكير",
                        style: AppTextStyles.font18DarkBlueSemiBold
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                )
              : CustomTextForm(
                  labelText: "الوقت",
                  controller: widget.customerTimeController,
                  readOnly: true,
                ),
        ],
      ),
    );
  }
}
            // final now = DateTime.now();
            // final selectedDateTime = DateTime(
            //   now.year,
            //   now.month,
            //   now.day,
            //   selectedTime!.hour,
            //   selectedTime!.minute,
            // );