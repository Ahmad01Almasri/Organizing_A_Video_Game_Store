import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/z.dart';
import '../cubits/device/device_cubit.dart';
import '../widgets/device/add/add_device_floating_action_button.dart';
import '../widgets/cubit_builder_home_page.dart';
import 'package:game_store/injection_container.dart' as di;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceCubit = DeviceCubit(deviceUseCase: di.sl<DeviceUseCase>())
      ..loadDevices();

    return BlocProvider(
      create: (context) => deviceCubit,
      child: Scaffold(
        body: SafeArea(
          child: CubitBuilderHomePage(
            devicecubit: deviceCubit,
          ),
        ),
        floatingActionButton: AddDeviceButton(
          deviceCubit: deviceCubit,
        ),
      ),
    );
  }
}
