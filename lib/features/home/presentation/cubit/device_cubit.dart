import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/features/home/data/models/device_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/submodel/customer_model.dart';
import '../../data/sources/local_device_data_source.dart';
import '../pages/home_page.dart';
import 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit() : super(DeviceInitial());

  void loadDevices() async {
    emit(DeviceLoading());
    try {
      final devices =
          LocalDeviceDataSource.listenToDevices().value.values.toList();
      emit(DeviceLoaded(devices));
    } catch (e) {
      emit(DeviceError("Failed to load devices"));
    }
  }

  void addDevice(DeviceModel device) async {
    try {
      await LocalDeviceDataSource.addDevice(device: device);
      loadDevices();
    } catch (e) {
      emit(DeviceError("Failed to add device"));
    }
  }

  void updateDevice(DeviceModel device) async {
    try {
      await LocalDeviceDataSource.updateDevice(device: device);
      loadDevices();
    } catch (e) {
      emit(DeviceError("Failed to update device"));
    }
  }

  void deleteDevice(DeviceModel device) async {
    try {
      await LocalDeviceDataSource.deleteDevice(device: device);
      loadDevices();
    } catch (e) {
      emit(DeviceError("Failed to delete device"));
    }
  }

  void toggleDeviceAvailability(DeviceModel device) async {
    try {
      var deviceBox = Hive.box<DeviceModel>('devicesBox');
      final updatedDevice = device.copyWith(isAvailable: !device.isAvailable);

      if (device.isInBox) {
        await deviceBox.put(device.id, updatedDevice);

        await updatedDevice.save();
      } else {
        await deviceBox.put(updatedDevice.id, updatedDevice);
      }
      updateDevice(updatedDevice);
    } catch (e) {
      var deviceBox = Hive.box<DeviceModel>('devicesBox');
      final updatedDevice = device.copyWith(isAvailable: !device.isAvailable);

      if (device.isInBox) {
        await deviceBox.put(device.id, updatedDevice);

        await updatedDevice.save();
      } else {
        await deviceBox.put(updatedDevice.id, updatedDevice);
      }
      updateDevice(updatedDevice);
    }
  }

  String getCustomerDuration(CustomerModel? customer) {
    final duration = DateTime.now().difference(customer!.createdAt);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    return "$hours:$minutes";
  }

  void filterDevicesByType(BuildContext context, String type) {
    final allDevices =
        LocalDeviceDataSource.listenToDevices().value.values.toList();

    if (type == "كل الأجهزة") {
      emit(DeviceLoaded(allDevices));
    } else {
      final filteredDevices =
          allDevices.where((device) => device.type == type).toList();

      if (filteredDevices.isEmpty) {
        // إظهار توست في حالة عدم وجود أجهزة من النوع المختار
        showCustomToast(context, "لا يوجد أجهزة من النوع المختار");
        emit(DeviceLoaded(allDevices)); // عرض كل الأجهزة في حال الفلترة الفارغة
      } else {
        emit(DeviceLoaded(filteredDevices));
      }
    }
  }
}
