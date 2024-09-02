import 'package:flutter/material.dart';
import 'package:game_store/core/helpers/spacing.dart';
import 'package:game_store/core/theming/styles.dart';

class EmptyDeviceListWidget extends StatelessWidget {
  const EmptyDeviceListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "أضف جهاز ",
          style: AppTextStyles.font35BlackBold,
        ),
        Center(child: Icon(Icons.format_list_bulleted_add, size: 250)),
      ],
    );
  }
}
