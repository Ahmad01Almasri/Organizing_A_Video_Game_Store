import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/device_model.dart';

class LocalDeviceDataSource {
  LocalDeviceDataSource._();

  static const _boxName = "devicesBox";
  static final Box<DeviceModel> _box = Hive.box<DeviceModel>(_boxName);

  static Future<Box<DeviceModel>> getDeviceBox() async {
    return await Hive.openBox<DeviceModel>(_boxName);
  }

  static ValueListenable<Box<DeviceModel>> listenToDevices() =>
      _box.listenable();

  static Future<void> addDevice({required DeviceModel device}) async =>
      await _box.put(device.id, device);

  static Future<void> updateDevice({required DeviceModel device}) async =>
      await device.save();

  static Future<void> deleteDevice({required DeviceModel device}) async =>
      await device.delete();

  static void clear() => _box.clear();
}
