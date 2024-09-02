import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/device_model.dart';
import '../../cubit/device_cubit.dart';

Future<void> showDeleteDeviceConfirmationDialog(
    BuildContext context, DeviceModel device) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // User must tap a button to confirm or cancel
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm Delete Comment',
          style: AppTextStyles.poppinsThinW6000style22,
        ),
        content: Text(
          'Are you sure you want to delete comment?',
          style:
              AppTextStyles.poppinsBoldstyle18.copyWith(color: AppColors.black),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        AppColors.black38.withOpacity(0.7))),
                child: Text('Cancel',
                    style: AppTextStyles.poppinsBoldstyle16
                        .copyWith(color: AppColors.green)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        AppColors.black38.withOpacity(0.7))),
                child: Text('Delete',
                    style: AppTextStyles.poppinsBoldstyle16
                        .copyWith(color: AppColors.red)),
                onPressed: () async {
                  context.read<DeviceCubit>().deleteDevice(device);

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
