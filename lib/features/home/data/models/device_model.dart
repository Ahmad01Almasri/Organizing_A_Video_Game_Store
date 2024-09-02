import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'device_model.g.dart';

@HiveType(typeId: 1)
class DeviceModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String type;
  @HiveField(3)
  String price;
  @HiveField(4)
  bool isAvailable;

  DeviceModel({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.isAvailable,
  });

  factory DeviceModel.create({
    required String? name,
    required String? type,
    required String? price,
    required bool? isAvailable,
  }) =>
      DeviceModel(
        id: const Uuid().v1(),
        name: name ?? "",
        type: type ?? "",
        price: price ?? "0.0",
        isAvailable: isAvailable ?? true,
      );
}
