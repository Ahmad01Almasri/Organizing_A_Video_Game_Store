import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/helpers/spacing.dart';
import 'form_detailss_session.dart';
import 'row_action_details_session_bottom_sheet.dart';

String selectedDevice = "";

Future<dynamic> showDetailsSessionBottomSheet(BuildContext context) {
  final customerNameController = TextEditingController();
  final customerTimeController = TextEditingController();

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
                customerTimeController: customerTimeController,
                customerNameController: customerNameController,
              ),
              verticalSpace(30),
              const RowActionButton(),
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
