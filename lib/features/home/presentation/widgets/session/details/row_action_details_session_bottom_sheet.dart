import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/features/home/data/models/device_model.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/sources/local_device_data_source.dart';
import '../../../cubit/device_cubit.dart';
import '../delete/closed_session_dialog.dart';
import 'action_button.dart';

class DeletSessionActionButton extends StatefulWidget {
  final DeviceModel device;
  const DeletSessionActionButton({
    super.key,
    required this.device,
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
            textNamestyle: AppTextStyles.poppinsBoldstyle16,
            onPressed: () {
              showClosedSessionDialog(context, widget.device);

              context
                  .read<DeviceCubit>()
                  .toggleDeviceAvailability(widget.device);
              widget.device.removeCustomer();
              LocalDeviceDataSource.updateDevice(device: widget.device);
            }),
        horizontalSpace(10),
        ActionButton(
            borderColor: AppColors.red,
            textNameButton: S.of(context).back,
            textNamestyle:
                AppTextStyles.poppinsBoldstyle16.copyWith(color: AppColors.red),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}