import '../../domain/repositories/device_repo.dart';
import '../models/device_model.dart';
import '../data_sources/local_device_data_source.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final LocalDeviceDataSource localDeviceDataSource;
  DeviceRepositoryImpl({
    required this.localDeviceDataSource,
  });
  @override
  Future<List<DeviceModel>> getDevices() async {
    return await localDeviceDataSource.getAllDevices();
  }

  @override
  Future<void> addDevice(DeviceModel device) async {
    await localDeviceDataSource.addDevice(device: device);
  }

  @override
  Future<void> updateDevice(DeviceModel device) async {
    await localDeviceDataSource.updateDevice(device: device);
  }

  @override
  Future<void> deleteDevice(DeviceModel device) async {
    await localDeviceDataSource.deleteDevice(device: device);
  }

  @override
  Future<void> toggleDeviceAvailability(DeviceModel device) async {
    final updatedDevice = device.copyWith(isAvailable: !device.isAvailable);
    await localDeviceDataSource.addDevice(device: updatedDevice);
  }

  @override
  Future<List<DeviceModel>> filterDevicesByType(String type) async {
    return await localDeviceDataSource.filterDevicesByType(type);
  }

  @override
  Future<void> clear() async {
    await localDeviceDataSource.clear();
  }
}
