import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/game_video_store_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/home/data/models/customer_model.dart';
import 'features/home/data/data_sources/local_device_data_source.dart';
import 'features/home/domain/use_cases/z.dart';
import 'features/home/presentation/cubit/device_cubit.dart';
import 'injection_container.dart' as di;
import 'core/routing/app_router.dart';
import 'features/home/data/models/device_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(DeviceModelAdapter());
  Hive.registerAdapter(CustomerModelAdapter());

  // Initialize dependencies
  await di.init();

  // Get the registered LocalDeviceDataSource from GetIt
  final localDeviceDataSource = di.sl<LocalDeviceDataSource>();
  await localDeviceDataSource.initialize(); // Ensure box initialization

  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  runApp(
    BlocProvider(
      create: (context) =>
          DeviceCubit(deviceUseCase: di.sl<DeviceUseCase>())..loadDevices(),
      child: GameStoreApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
