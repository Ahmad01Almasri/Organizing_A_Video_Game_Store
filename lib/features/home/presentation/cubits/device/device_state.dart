import '../../../data/models/device_model.dart';

class DeviceState {
  final DeviceStateType type;
  final List<DeviceModel>? devices;
  final String? message;

  DeviceState._({
    required this.type,
    this.devices,
    this.message,
  });

  factory DeviceState.initial() {
    return DeviceState._(type: DeviceStateType.initial);
  }

  factory DeviceState.loading() {
    return DeviceState._(type: DeviceStateType.loading);
  }

  factory DeviceState.loaded(List<DeviceModel> devices) {
    return DeviceState._(type: DeviceStateType.loaded, devices: devices);
  }

  factory DeviceState.error(String message) {
    return DeviceState._(type: DeviceStateType.error, message: message);
  }
}

enum DeviceStateType { initial, loading, loaded, error }
