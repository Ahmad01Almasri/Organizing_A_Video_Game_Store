import 'package:flutter/material.dart';
import 'package:game_store/features/home/data/models/device_model.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../cubits/device/device_cubit.dart';
import '../delete/closed_session_dialog.dart';
import 'action_button.dart';

class DeletSessionActionButton extends StatefulWidget {
  final DeviceModel device;
  final DeviceCubit deviceCubit;
  const DeletSessionActionButton({
    super.key,
    required this.device,
    required this.deviceCubit,
  });

  @override
  State<DeletSessionActionButton> createState() =>
      _DeletSessionActionButtonState();
}

class _DeletSessionActionButtonState extends State<DeletSessionActionButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ActionButton(
            backgroundColor: AppColors.primaryColor,
            textNameButton: S.of(context).end_session,
            textNamestyle: AppTextStyles.font16WhiteBold,
            onPressed: () async {
              showClosedSessionDialog(
                  context, widget.device, widget.deviceCubit);
              await widget.device.removeCustomer();
              await widget.deviceCubit.toggleDeviceAvailability(widget.device);
            }),
        horizontalSpace(10),
        ActionButton(
            borderColor: AppColors.red,
            textNameButton: S.of(context).back,
            textNamestyle:
                AppTextStyles.font16WhiteBold.copyWith(color: AppColors.red),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}
