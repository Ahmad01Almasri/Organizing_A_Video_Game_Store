import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/theming/colors.dart';
import 'package:game_store/core/theming/styles.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../data/models/device_model.dart';
import '../../../cubit/device_cubit.dart';

Future<void> showClosedSessionDialog(
    BuildContext context, DeviceModel device) async {
  // Get the duration from the cubit
  final durationString =
      context.read<DeviceCubit>().getCustomerDuration(device.customer);

  // Ensure the duration is converted to an int, default to 0 if conversion fails
  final duration = int.tryParse(durationString.toString()) ?? 0;
  // Try to parse the price and handle potential null/invalid values
  final price = double.tryParse(device.price) ?? 0;

  final totalPrice = price * duration / 60;

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Text(
          S.of(context).the_session_is_closed,
          style: AppTextStyles.font24BlackBold,
        ),
        content: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: S.of(context).customer_account,
                style: AppTextStyles.font16grayBold,
              ),
              TextSpan(
                text:
                    totalPrice.toStringAsFixed(2), // format to 2 decimal places
                style: AppTextStyles.font16grayBold
                    .copyWith(color: AppColors.primaryColor),
              ),
              TextSpan(
                text: S.of(context).currency,
                style: AppTextStyles.font16grayBold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: AppColors.grey,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              S.of(context).close,
              style: AppTextStyles.font15DarkBold,
            ),
          )
        ],
      );
    },
  );
}
