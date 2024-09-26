import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widget/drawer.dart';
import '../../../../generated/l10n.dart';
import '../../domain/use_cases/z.dart';
import '../cubits/device/device_cubit.dart';
import '../cubits/device/device_state.dart';
import '../widgets/device/add/add_device_floating_action_button.dart';
import '../widgets/device/cubit_builder_get_all_devices.dart';
import 'package:game_store/injection_container.dart' as di;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceCubit = DeviceCubit(deviceUseCase: di.sl<DeviceUseCase>())
      ..loadDevices();

    return BlocProvider(
      create: (context) => deviceCubit,
      child: BlocBuilder<DeviceCubit, DeviceState>(
        builder: (context, state) {
          final devices = state.devices ?? [];
          if (state.type == DeviceStateType.loaded) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  S.of(context).title,
                  style:
                      AppTextStyles.font18BlackBold.copyWith(fontSize: 25.sp),
                ),
                actions: [
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      context
                          .read<DeviceCubit>()
                          .filterDevicesByType(context, value);
                    },
                    icon: const Icon(
                      Icons.filter_list,
                      size: 30,
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "All devices",
                        child: Text("All devices"),
                      ),
                      const PopupMenuItem(
                        value: "laptop",
                        child: Text("laptop"),
                      ),
                      const PopupMenuItem(
                        value: "computer",
                        child: Text("computer"),
                      ),
                      const PopupMenuItem(
                        value: "playstation",
                        child: Text("playstation"),
                      ),
                    ],
                  ),
                ],
              ),
              drawer: MyDrawer(devices: devices), // تمرير الأجهزة إلى الدراج
              body: SafeArea(
                child: CubitBuilderHomePage(
                  devicecubit: deviceCubit,
                ),
              ),
              floatingActionButton: AddDeviceButton(
                deviceCubit: deviceCubit,
              ),
            );
          } else if (state.type == DeviceStateType.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Error loading devices'));
          }
        },
      ),
    );
  }
}
