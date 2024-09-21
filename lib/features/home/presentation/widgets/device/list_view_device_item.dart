import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/features/home/data/models/device_model.dart';
import 'package:game_store/features/home/presentation/cubits/device/device_cubit.dart';

import 'card_decive.dart';

class ListViewDevices extends StatelessWidget {
  final List<DeviceModel> devices;
  final DeviceCubit deviceCubit;
  const ListViewDevices({
    super.key,
    required this.devices,
    required this.deviceCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: BouncingScrollPhysics(), // تأكد من وجود فيزياء ملائمة

          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return CardDevice(
              deviceCubit: deviceCubit,
              device: devices[index],
              index: index,
            );
          }),
    );
  }
}
