import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'card_item.dart';

class ListViewDevices extends StatelessWidget {
  const ListViewDevices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: 6,
        itemBuilder: (context, index) => const CardItem(),
      ),
    );
  }
}
