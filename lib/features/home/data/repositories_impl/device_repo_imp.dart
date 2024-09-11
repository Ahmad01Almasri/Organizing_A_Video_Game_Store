import '../../domain/repositories/device_repo.dart';
import '../models/device_model.dart';
import '../sources/local_device_data_source.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  @override
  Future<List<DeviceModel>> getDevices() async {
    return await LocalDeviceDataSource.getAllDevices();
  }

  @override
  Future<void> addDevice(DeviceModel device) async {
    await LocalDeviceDataSource.addDevice(device: device);
  }

  @override
  Future<void> updateDevice(DeviceModel device) async {
    await LocalDeviceDataSource.updateDevice(device: device);
  }

  @override
  Future<void> deleteDevice(DeviceModel device) async {
    await LocalDeviceDataSource.deleteDevice(device: device);
  }

  @override
  Future<void> toggleDeviceAvailability(DeviceModel device) async {
    final updatedDevice = device.copyWith(isAvailable: !device.isAvailable);
    await LocalDeviceDataSource.addDevice(device: updatedDevice);
  }

  @override
  Future<List<DeviceModel>> filterDevicesByType(String type) async {
    return await LocalDeviceDataSource.filterDevicesByType(type);
  }

  @override
  Future<void> clear() async {
    await LocalDeviceDataSource.clear();
  }
}
