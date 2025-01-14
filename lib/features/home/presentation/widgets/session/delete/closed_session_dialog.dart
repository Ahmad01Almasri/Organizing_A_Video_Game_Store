import 'package:flutter/material.dart';
import '../../../../data/models/device_model.dart';
import '../../../cubits/device/device_cubit.dart';
import 'package:game_store/core/theming/app_colors.dart';
import 'package:game_store/core/theming/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';

Future<void> showClosedSessionDialog(
    BuildContext context, DeviceModel device, DeviceCubit deviceCubit) async {
  // Get the duration from the cubit
  final durationString = deviceCubit.getCustomerDuration(device.customer);

  // Ensure the duration is split into hours and minutes
  final parts = durationString?.split(':');
  if (parts == null || parts.length != 2) {
    print('Invalid duration format');
    return;
  }

  // Parse hours and minutes
  final hours = int.tryParse(parts[0]) ?? 0;
  final minutes = int.tryParse(parts[1]) ?? 0;

  // Convert the total duration to minutes
  final totalMinutes = (hours * 60) + minutes;
  print('Total minutes: $totalMinutes');

  // Try to parse the price and handle potential null/invalid values
  final price = double.tryParse(device.price) ?? 0;
  print('Price per hour: $price');

  // Calculate the total price
  final totalPrice = price * totalMinutes / 60;
  print('Total price: $totalPrice');

  // Update the total price for the customer in the device and save the device
  if (device.customer != null) {
    device.customer!.totalPrice = totalPrice; // Store the calculated price
    await device.save(); // Save the device, which also saves the customer
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
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
                    totalPrice.toStringAsFixed(1), // format to 2 decimal places
                style: AppTextStyles.font16grayBold
                    .copyWith(color: AppColors.primaryColor),
              ),
              const TextSpan(
                text: " ",
              ),
              TextSpan(
                text: S.of(context).currency,
                style: AppTextStyles.font16grayBold
                    .copyWith(color: AppColors.black),
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
            color: AppColors.primaryColor,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              S.of(context).close,
              style:
                  AppTextStyles.font15DarkBold.copyWith(color: AppColors.white),
            ),
          )
        ],
      );
    },
  );
}
