import '../../data/models/device_model.dart';

abstract class DeviceRepository {
  Future<List<DeviceModel>> getDevices();
  Future<void> addDevice(DeviceModel device);
  Future<void> updateDevice(DeviceModel device);
  Future<void> deleteDevice(DeviceModel device);
  Future<void> toggleDeviceAvailability(DeviceModel device);
  Future<List<DeviceModel>> filterDevicesByType(String type);
  Future<void> clear();
}
