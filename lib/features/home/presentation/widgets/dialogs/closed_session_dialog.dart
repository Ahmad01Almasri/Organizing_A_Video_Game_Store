import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/theming/colors.dart';
import 'package:game_store/core/theming/styles.dart';

import '../../../data/models/device_model.dart';
import '../../cubit/device_cubit.dart';

Future<void> showClosedSessionDialog(
    BuildContext context, DeviceModel device) async {
  // Get the duration from the cubit
  final durationString =
      context.read<DeviceCubit>().getCustomerDuration(device.customer);

  // Ensure the duration is converted to an int, default to 0 if conversion fails
  final duration = int.tryParse(durationString.toString()) ?? 0;

  // Print the device price for debugging purposes
  print("Device price: ${device.price}");

  // Try to parse the price and handle potential null/invalid values
  final price = double.tryParse(device.price) ?? 0;

  final totalPrice = price * duration / 60;
  // Check if price parsing failed

  print("Device price: ${price}");
  print("Device price: ${price * duration / 60}");
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(
            "تم إغلاق الجلسة",
            style: AppTextStyles.font24BlackBold,
          ),
          content: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'حساب الزبون : ',
                  style: AppTextStyles.font16grayBold,
                ),
                TextSpan(
                  text: totalPrice
                      .toStringAsFixed(2), // format to 2 decimal places
                  style: AppTextStyles.font16grayBold
                      .copyWith(color: AppColors.primaryColor),
                ),
                TextSpan(
                  text: ' ل.س',
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
                "إغلاق",
                style: AppTextStyles.font15DarkBold,
              ),
            )
          ],
        ),
      );
    },
  );
}
