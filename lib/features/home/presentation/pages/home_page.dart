// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/device_cubit.dart';
import '../cubit/device_state.dart';
import '../widgets/add_item_floating_action_button.dart';
import '../widgets/empty_device_list.dart';
import '../widgets/list_view_device_item.dart';
import '../widgets/top_bar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<DeviceCubit, DeviceState>(
            builder: (context, state) {
              if (state is DeviceLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DeviceLoaded) {
                final devices = state.devices;
                return devices.isEmpty
                    ? const EmptyDeviceListWidget()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TopBarHome(),
                          ListViewDevices(devices: devices),
                        ],
                      );
              } else if (state is DeviceError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        floatingActionButton: const AddItemButton(),
      ),
    );
  }
}
