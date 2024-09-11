import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/device_model.dart';
import '../../domain/use_cases/z.dart';
import 'device_state.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../widgets/device/show_no_device_type_toast.dart';

class DeviceCubit extends Cubit<DeviceState> {
  final DeviceUseCase? deviceUseCase;

  DeviceCubit({this.deviceUseCase}) : super(DeviceState.initial());

  void loadDevices() async {
    emit(DeviceState.loading());
    try {
      final devices = await deviceUseCase!.loadDevices();
      emit(DeviceState.loaded(devices));
    } catch (e) {
      print('Error loading devices: $e'); // طباعة الخطأ في وحدة التحكم
      emit(DeviceState.error("Failed to load devices"));
    }
  }

  void filterDevicesByType(BuildContext context, String type) async {
    try {
      emit(DeviceState.loading());
      final filteredDevices = await deviceUseCase!.filterDevicesByType(type);
      if (filteredDevices.isEmpty) {
        showNoDeviceTypeToast(context, S.of(context).no_devices);
        final devices = await deviceUseCase!.loadDevices();

        emit(DeviceState.loaded(devices));
      } else {
        emit(DeviceState.loaded(filteredDevices));
      }
    } catch (e) {
      emit(DeviceState.error("Failed to filter devices"));
    }
  }

  void addDevice(DeviceModel device) async {
    try {
      await deviceUseCase!.addDevice(device);
      loadDevices();
    } catch (e) {
      emit(DeviceState.error("Failed to add device"));
    }
  }

  void updateDevice(DeviceModel device) async {
    try {
      await deviceUseCase!.updateDevice(device);
      loadDevices();
    } catch (e) {
      emit(DeviceState.error("Failed to update device"));
    }
  }

  void deleteDevice(DeviceModel device) async {
    try {
      await deviceUseCase!.deleteDevice(device);
      loadDevices();
    } catch (e) {
      emit(DeviceState.error("Failed to delete device"));
    }
  }

  Future<void> toggleDeviceAvailability(DeviceModel device) async {
    try {
      await deviceUseCase!.toggleDeviceAvailability(device);
      loadDevices();
    } catch (e) {
      emit(DeviceState.error("Failed to toggle device availability: $e"));
    }
  }

  String? getCustomerDuration(CustomerModel? customer) {
    if (customer == null) return null;
    try {
      return deviceUseCase!.getCustomerDuration(customer);
    } catch (e) {
      emit(DeviceState.error("Failed to calculate customer duration"));
      return null;
    }
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:game_store/features/home/data/models/device_model.dart';
// import 'package:game_store/features/home/presentation/widgets/device/show_no_device_type_toast.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import '../../../../generated/l10n.dart';
// import '../../data/models/customer_model.dart';
// import '../../data/sources/local_device_data_source.dart';
// import 'device_state.dart';

// class DeviceCubit extends Cubit<DeviceState> {
//   DeviceCubit() : super(DeviceState.initial());

//   void loadDevices() async {
//     emit(DeviceState.loading());
//     try {
//       final devices =
//           LocalDeviceDataSource.listenToDevices().value.values.toList();
//       emit(DeviceState.loaded(devices));
//     } catch (e) {
//       emit(DeviceState.error("Failed to load devices"));
//     }
//   }

//   void addDevice(DeviceModel device) async {
//     try {
//       await LocalDeviceDataSource.addDevice(device: device);
//       loadDevices();
//     } catch (e) {
//       emit(DeviceState.error("Failed to add device"));
//     }
//   }

//   void updateDevice(DeviceModel device) async {
//     try {
//       await LocalDeviceDataSource.updateDevice(device: device);
//       loadDevices();
//     } catch (e) {
//       emit(DeviceState.error("Failed to update device"));
//     }
//   }

//   void deleteDevice(DeviceModel device) async {
//     try {
//       await LocalDeviceDataSource.deleteDevice(device: device);
//       loadDevices();
//     } catch (e) {
//       emit(DeviceState.error("Failed to delete device"));
//     }
//   }

//   void toggleDeviceAvailability(DeviceModel device) async {
//     try {
//       var deviceBox = Hive.box<DeviceModel>('devicesBox');
//       final updatedDevice = device.copyWith(isAvailable: !device.isAvailable);

//       if (device.isInBox) {
//         await deviceBox.put(device.id, updatedDevice);
//         await updatedDevice.save();
//       } else {
//         await deviceBox.put(updatedDevice.id, updatedDevice);
//       }
//       updateDevice(updatedDevice);
//     } catch (e) {
//       var deviceBox = Hive.box<DeviceModel>('devicesBox');
//       final updatedDevice = device.copyWith(isAvailable: !device.isAvailable);

//       if (device.isInBox) {
//         await deviceBox.put(device.id, updatedDevice);
//         await updatedDevice.save();
//       } else {
//         await deviceBox.put(updatedDevice.id, updatedDevice);
//       }
//       updateDevice(updatedDevice);
//     }
//   }

//   String getCustomerDuration(CustomerModel? customer) {
//     final duration = DateTime.now().difference(customer!.createdAt);
//     final hours = duration.inHours;
//     final minutes = duration.inMinutes.remainder(60);
//     return "$hours:$minutes";
//   }

//   void filterDevicesByType(BuildContext context, String type) {
//     final allDevices =
//         LocalDeviceDataSource.listenToDevices().value.values.toList();

//     if (type == S.of(context).all_devices) {
//       emit(DeviceState.loaded(allDevices));
//     } else {
//       final filteredDevices =
//           allDevices.where((device) => device.type == type).toList();

//       if (filteredDevices.isEmpty) {
//         showNoDeviceTypeToast(context, S.of(context).no_devices);
//         emit(DeviceState.loaded(allDevices));
//       } else {
//         emit(DeviceState.loaded(filteredDevices));
//       }
//     }
//   }
// }