import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/features/home/data/models/device_model.dart';
import '../../data/sources/local_device_data_source.dart';
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
}
