import 'package:get_it/get_it.dart';
import 'features/home/domain/repositories/device_repo.dart';
import 'features/home/domain/use_cases/z.dart';
import 'features/home/presentation/cubit/device_cubit.dart';
import 'features/home/data/repositories_impl/device_repo_imp.dart';
import 'features/home/data/data_sources/local_device_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data sources
  sl.registerLazySingleton<LocalDeviceDataSource>(
      () => LocalDeviceDataSource());

  // Repository
  sl.registerLazySingleton<DeviceRepository>(
      () => DeviceRepositoryImpl(localDeviceDataSource: sl()));

  // Use cases
  sl.registerLazySingleton(() => DeviceUseCase(sl()));

  // Cubit
  sl.registerFactory(() => DeviceCubit(deviceUseCase: sl()));
}
