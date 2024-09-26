import 'package:flutter/material.dart';
import 'package:game_store/features/home/presentation/cubits/device/device_cubit.dart';
import '../../../../../../core/services/notification_services.dart';
import '../../../../../../core/theming/app_colors.dart';
import 'add_device_bottom_sheet.dart';

class AddDeviceButton extends StatelessWidget {
  final DeviceCubit deviceCubit;
  const AddDeviceButton({
    super.key,
    required this.deviceCubit,
  });
  setAlarmExample() async {
    // تحديد وقت المنبه
    DateTime alarmTime =
        DateTime.now().add(Duration(seconds: 10)); // بعد 10 ثوانٍ

    // استدعاء دالة ضبط المنبه
    await NotificationService().scheduleAlarm(
      alarmName: "الاستيقاظ",
      alarmTime: alarmTime,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      onPressed: () async {
        showAddDeviceBottomSheet(context, deviceCubit);
        // await setAlarmExample();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("تم ضبط المنبه بنجاح!")),
        // );
        // print("تم ضبط المنبه");
      },
      child: const Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
  }
}
