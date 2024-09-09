import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'customer_model.dart';

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
  @HiveField(5)
  CustomerModel? customer; // Nullable to allow for no customer

  DeviceModel({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.isAvailable,
    this.customer,
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

  // Method to set a new customer
  void setCustomer(CustomerModel customer) {
    this.customer = customer;
    save(); // Save the updated device
  }

// Method to remove the current customer
  void removeCustomer() async {
    if (this.customer != null) {
      this.customer = null;

      if (this.isInBox) {
        await this.save();
      } else {
        var deviceBox = Hive.box<DeviceModel>('devicesBox');
        await deviceBox.put(this.id, this);
      }
    }
  }

  DeviceModel copyWith({
    String? name,
    String? type,
    String? price,
    bool? isAvailable,
    CustomerModel? customer,
  }) {
    return DeviceModel(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
      customer: customer ?? this.customer,
    );
  }
}
