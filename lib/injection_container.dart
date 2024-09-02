import 'package:get_it/get_it.dart';
import 'package:game_store/features/home/presentation/cubit/device_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register DeviceCubit
  sl.registerFactory(() => DeviceCubit());
}
