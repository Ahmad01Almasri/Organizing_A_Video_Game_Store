import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class ActionButton extends StatelessWidget {
  final String textNameButton;
  final Color? borderColor;
  final TextStyle textNamestyle;
  final void Function()? onPressed;
  final Color? backgroundColor;
  const ActionButton({
    super.key,
    required this.textNameButton,
    this.borderColor,
    required this.textNamestyle,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          textStyle: AppTextStyles.poppinsBoldstyle16,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: borderColor ?? AppColors.primaryColor),
          ),
        ),
        child: Text(
          textNameButton,
          style: textNamestyle,
        ),
      ),
    );
  }
}
