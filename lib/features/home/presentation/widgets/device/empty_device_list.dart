import 'package:flutter/material.dart';
import 'package:game_store/core/theming/app_text_styles.dart';

import '../../../../../generated/l10n.dart';

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
          S.of(context).add_device,
          style: AppTextStyles.font35BlackBold,
        ),
        const Center(child: Icon(Icons.format_list_bulleted_add, size: 250)),
      ],
    );
  }
}
