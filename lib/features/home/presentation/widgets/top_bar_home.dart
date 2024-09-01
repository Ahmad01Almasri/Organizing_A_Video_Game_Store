import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class TopBarHome extends StatelessWidget {
  const TopBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        "الأجهزة",
        style: AppTextStyles.font20BlackBold,
      ),
    );
  }
}
