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

void showCustomToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.4,
      left: MediaQuery.of(context).size.width * 0.15,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.red, // لون التوست الأحمر
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlay?.insert(overlayEntry);
  // إخفاء التوست بعد 2 ثانية
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
