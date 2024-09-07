import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/features/home/data/models/device_model.dart';

import 'card_decive.dart';

class ListViewDevices extends StatelessWidget {
  final List<DeviceModel> devices;
  const ListViewDevices({
    super.key,
    required this.devices,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return CardDevice(
              device: devices[index],
              index: index,
            );
          }),
    );
  }
}
