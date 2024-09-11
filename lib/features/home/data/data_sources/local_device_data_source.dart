import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/device_model.dart';

class LocalDeviceDataSource {
  static const _boxName = "devicesBox";
  late Box<DeviceModel> _box;

  LocalDeviceDataSource() {
    initialize();
  }

  Future<void> initialize() async {
    _box = await Hive.openBox<DeviceModel>(_boxName);
  }

  ValueListenable<Box<DeviceModel>> listenToDevices() {
    return _box.listenable();
  }

  Future<List<DeviceModel>> getAllDevices() async {
    try {
      return _box.values.toList();
    } catch (e) {
      print('Error getting all devices: $e');
      return [];
    }
  }

  Future<List<DeviceModel>> filterDevicesByType(String type) async {
    final allDevices = _box.values.toList();
    if (type == "All devices") {
      return allDevices;
    }
    return allDevices.where((device) => device.type == type).toList();
  }

  Future<void> addDevice({required DeviceModel device}) async {
    await _box.put(device.id, device);
  }

  Future<void> updateDevice({required DeviceModel device}) async {
    await device.save();
  }

  Future<void> deleteDevice({required DeviceModel device}) async {
    await device.delete();
  }

  Future<void> toggleDeviceAvailability(DeviceModel device) async {
    final updatedDevice = device.copyWith(isAvailable: !device.isAvailable);
    if (device.isInBox) {
      await _box.put(device.id, updatedDevice);
    } else {
      await _box.put(updatedDevice.id, updatedDevice);
    }
    await updatedDevice.save();
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
