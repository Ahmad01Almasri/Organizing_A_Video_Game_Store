import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';

Future<TimeOfDay?> showTimeSelectionDialog(BuildContext context) async {
  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    cancelText: S.of(context).cancel,
    confirmText: S.of(context).ok,
    helpText: S.of(context).choose_time,
  );
  return selectedTime;
}
