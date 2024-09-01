import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class SaveAddItemButton extends StatelessWidget {
  const SaveAddItemButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      onPressed: () {},
      color: AppColors.primaryColor,
      child: Text(
        "حفظ",
        style: AppTextStyles.font17WhiteMedium,
      ),
    );
  }
}
