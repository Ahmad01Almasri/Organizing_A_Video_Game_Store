import 'package:flutter/material.dart';
import '../../../../../core/theming/time_picker_theme.dart';

Future<TimeOfDay?> showTimeSelectionDialog(BuildContext context) async {
  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    cancelText: "الإلغاء",
    confirmText: "حسناً",
    helpText: "اختيار الوقت",
    builder: (BuildContext context, Widget? child) {
      return MyThemeTimePicker(
        child: child,
      );
    },
  );
  return selectedTime;
}
