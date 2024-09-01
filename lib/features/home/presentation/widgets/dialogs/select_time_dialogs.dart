import 'package:flutter/material.dart';
import '../../../../../core/theming/time_picker_theme.dart';

Future<void> showTimeSelectionDialog(BuildContext context) async {
  TimeOfDay? selectedTime = await showTimePicker(
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

  if (selectedTime != null) {
    // Handle the selected time here. For example, storing the selected time.
    print("Selected time: ${selectedTime.format(context)}");

    // If you want to show the selected time in a UI widget, you can update a stateful widget.
  }
}
