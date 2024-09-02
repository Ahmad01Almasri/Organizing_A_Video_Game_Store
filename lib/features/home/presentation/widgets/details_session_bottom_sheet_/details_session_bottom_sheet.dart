import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import 'form_detailss_session.dart';
import 'row_action_details_session_bottom_sheet.dart';

String selectedDevice = "";

Future<dynamic> showDetailsSessionBottomSheet(
    BuildContext context, bool isAvailable) {
  final customerNameController = TextEditingController();
  final customerTimeController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final FocusNode nameFocusNode = FocusNode();
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) => Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              FormTextDetailsSession(
                formstate: formstate,
                isAvailable: isAvailable,
                customerTimeController: customerTimeController,
                customerNameController: customerNameController,
              ),
              verticalSpace(30),
              isAvailable
                  ? const RowActionButton()
                  : MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      onPressed: () {
                        if (formstate.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      },
                      color: AppColors.primaryColor,
                      child: Text(
                        "حفظ",
                        style: AppTextStyles.font17WhiteMedium,
                      ),
                    ),
              verticalSpace(290),
            ],
          ),
        ),
      ),
    ),
  ).whenComplete(() {
    nameFocusNode.dispose();
  });
}
