import 'package:flutter/material.dart';
import 'package:game_store/core/helpers/spacing.dart';
import 'package:game_store/core/theming/app_text_styles.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/models/device_model.dart';
import '../../../cubits/device/device_cubit.dart';
import '../details/action_button.dart';
import 'closed_session_dialog.dart';

class DeletSessionActionButton extends StatelessWidget {
  final DeviceModel device;
  final DeviceCubit deviceCubit;

  const DeletSessionActionButton({
    super.key,
    required this.device,
    required this.deviceCubit,
  });

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
            await showClosedSessionDialog(context, device, deviceCubit);
            await device.removeCustomer();
            await deviceCubit.toggleDeviceAvailability(device);
          },
        ),
        horizontalSpace(10),
        ActionButton(
          borderColor: AppColors.red,
          textNameButton: S.of(context).back,
          textNamestyle:
              AppTextStyles.font16WhiteBold.copyWith(color: AppColors.red),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
