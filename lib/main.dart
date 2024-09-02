import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/game_video_store_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'injection_container.dart' as di;

import 'core/routing/app_router.dart';
import 'features/home/data/models/device_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await Hive.initFlutter();
  Hive.registerAdapter(DeviceModelAdapter());
  await Hive.openBox<DeviceModel>("devicesBox");
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp(GameStoreApp(
    appRouter: AppRouter(),
  ));
}
