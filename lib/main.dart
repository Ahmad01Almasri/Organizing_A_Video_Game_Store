import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/game_video_store_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/home/data/models/customer_model.dart';
import 'features/home/presentation/cubit/device_cubit.dart';
import 'injection_container.dart' as di;
// import 'package:timezone/data/latest.dart' as tz;
import 'core/routing/app_router.dart';
import 'features/home/data/models/device_model.dart';

void main() async {
  // Initialize Hive and Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(DeviceModelAdapter());
  Hive.registerAdapter(CustomerModelAdapter());

  // Open your boxes
  await Hive.openBox<DeviceModel>('devicesBox');

  // Initialize dependencies
  await di.init();

  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  // // Initialize time zone for notification scheduling
  // tz.initializeTimeZones();

  // // Setup notifications
  // await setupNotifications();

  runApp(
    BlocProvider(
      create: (context) => DeviceCubit()..loadDevices(),
      child: GameStoreApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
