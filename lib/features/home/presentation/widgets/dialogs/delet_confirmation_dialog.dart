import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/helpers/extensions.dart';
import 'package:game_store/features/home/presentation/cubit/device_cubit.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/device_model.dart';

Future<void> showDeleteDeviceConfirmationDialog(
    BuildContext context, DeviceModel device) async {
  final _cubit = BlocProvider.of<DeviceCubit>(context);

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
                  _cubit.deleteDevice(device);

                  context.pushReplacementNamed(Routes.homeScreen);
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
