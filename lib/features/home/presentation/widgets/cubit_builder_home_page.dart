import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/device/device_cubit.dart';
import '../cubits/device/device_state.dart';
import '../widgets/empty_device_list.dart';
import 'device/list_view_device_item.dart';
import '../widgets/top_bar_home.dart';

class CubitBuilderHomePage extends StatelessWidget {
  final DeviceCubit devicecubit;

  const CubitBuilderHomePage({
    super.key,
    required this.devicecubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceCubit, DeviceState>(
      builder: (context, state) {
        if (state.type == DeviceStateType.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.type == DeviceStateType.loaded) {
          final devices = state.devices ?? [];
          return devices.isEmpty
              ? const EmptyDeviceListWidget()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TopBarHome(
                    //   device: devices, // Passing devices to TopBarHome
                    //   onFilterSelected: (String type) {
                    //     context
                    //         .read<DeviceCubit>()
                    //         .filterDevicesByType(context, type);
                    //   },
                    // ),
                    ListViewDevices(
                      devices: devices,
                      deviceCubit: devicecubit,
                    ),
                  ],
                );
        } else if (state.type == DeviceStateType.error) {
          return Center(child: Text(state.message ?? 'An error occurred'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
