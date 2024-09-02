import 'package:flutter/material.dart';
import 'package:game_store/core/theming/colors.dart';
import 'package:game_store/core/theming/styles.dart';
import '../../../../../core/helpers/app_constants.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widget/custom_text_field.dart';
import '../dialogs/select_time_dialogs.dart';

class FormTextDetailsSession extends StatefulWidget {
  const FormTextDetailsSession({
    super.key,
    required this.customerNameController,
    required this.customerTimeController,
    required this.isAvailable,
    required this.formstate,
  });
  final bool isAvailable;
  final TextEditingController customerNameController;
  final TextEditingController customerTimeController;
  final GlobalKey<FormState> formstate;

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
            focusNode: _nameFocusNode,
            controller: widget.customerNameController,
            validator: (text) {
              return AppConstants.validationNotEmpty(text);
            },
            readOnly: widget.isAvailable ? false : true,
          ),
          verticalSpace(10),
          widget.isAvailable
              ? TextButton(
                  onPressed: () => showTimeSelectionDialog(context),
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
                  ))
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
