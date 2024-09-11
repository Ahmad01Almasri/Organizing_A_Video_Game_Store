import '../../data/models/customer_model.dart';
import '../../data/models/device_model.dart';
import '../repositories/device_repo.dart';

class DeviceUseCase {
  final DeviceRepository deviceRepository;

  DeviceUseCase(this.deviceRepository);

  Future<List<DeviceModel>> loadDevices() async {
    try {
      return await deviceRepository.getDevices();
    } catch (e) {
      print('Error loading devices: $e');
      throw e;
    }
  }

  Future<List<DeviceModel>> filterDevicesByType(String type) async {
    return await deviceRepository.filterDevicesByType(type);
  }

  Future<void> addDevice(DeviceModel device) async {
    await deviceRepository.addDevice(device);
  }

  Future<void> updateDevice(DeviceModel device) async {
    await deviceRepository.updateDevice(device);
  }

  Future<void> deleteDevice(DeviceModel device) async {
    await deviceRepository.deleteDevice(device);
  }

  Future<void> toggleDeviceAvailability(DeviceModel device) async {
    await deviceRepository.toggleDeviceAvailability(device);
  }

  Future<void> clearDevices() async {
    await deviceRepository.clear();
  }

  String getCustomerDuration(CustomerModel customer) {
    final duration = DateTime.now().difference(customer.createdAt);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return "$hours:$minutes";
  }
}
