import 'package:flutter/material.dart';
import 'package:game_store/core/theming/colors.dart';
import 'package:game_store/core/theming/styles.dart';

void showNoDeviceTypeToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.4,
      left: MediaQuery.of(context).size.width * 0.15,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(message,
                textAlign: TextAlign.center,
                style: AppTextStyles.font18WhiteMedium),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
