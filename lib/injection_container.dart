import 'package:get_it/get_it.dart';

import 'features/home/presentation/cubit/device_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => DeviceCubit());
}
