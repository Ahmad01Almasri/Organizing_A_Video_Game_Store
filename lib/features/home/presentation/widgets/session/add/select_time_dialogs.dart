import 'package:flutter/material.dart';
import '../../../../../../core/theming/time_picker_theme.dart';
import '../../../../../../generated/l10n.dart';

Future<TimeOfDay?> showTimeSelectionDialog(BuildContext context) async {
  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    cancelText: S.of(context).cancel,
    confirmText: S.of(context).ok,
    helpText: S.of(context).choose_time,
    builder: (BuildContext context, Widget? child) {
      return MyThemeTimePicker(
        child: child,
      );
    },
  );
  return selectedTime;
}
