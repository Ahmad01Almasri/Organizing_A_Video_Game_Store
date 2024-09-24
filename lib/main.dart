import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:game_store/features/home/data/models/customer_model.dart';
import 'package:game_store/features/home/data/models/device_model.dart';
import 'package:game_store/features/home/data/models/finished_customers_manager.dart';
import 'core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/injection_container.dart' as di;

import 'features/home/data/data_sources/local_device_data_source.dart';
import 'game_video_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(DeviceModelAdapter());
  Hive.registerAdapter(CustomerModelAdapter());
  Hive.registerAdapter(FinishedCustomersManagerAdapter());
  // Initialize dependencies (if any)
  await di.init(); // Uncomment if using dependency injection
  // Get the registered LocalDeviceDataSource from GetIt
  final localDeviceDataSource = di.sl<LocalDeviceDataSource>();
  await localDeviceDataSource.initialize();
// Open Hive boxes
  await Hive.openBox<FinishedCustomersManager>('finishedCustomersManagerBox');

  // Initialize FinishedCustomersManager if not already
  var finishedCustomersBox =
      Hive.box<FinishedCustomersManager>('finishedCustomersManagerBox');
  if (finishedCustomersBox.get('manager') == null) {
    await finishedCustomersBox.put('manager', FinishedCustomersManager());
  }

// Ensure box initialization
  // Ensure screen util
  await ScreenUtil.ensureScreenSize();

  runApp(
    GameStoreApp(
      appRouter: AppRouter(),
    ),
  );
}
