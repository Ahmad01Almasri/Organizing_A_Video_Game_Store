import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/device_cubit.dart';
import '../cubit/device_state.dart';
import '../widgets/empty_device_list.dart';
import 'device/list_view_device_item.dart';
import '../widgets/top_bar_home.dart';

class CubitBuilderHomePage extends StatelessWidget {
  const CubitBuilderHomePage({
    super.key,
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
                    TopBarHome(
                      onFilterSelected: (String type) {
                        context
                            .read<DeviceCubit>()
                            .filterDevicesByType(context, type);
                      },
                    ),
                    ListViewDevices(devices: devices),
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
