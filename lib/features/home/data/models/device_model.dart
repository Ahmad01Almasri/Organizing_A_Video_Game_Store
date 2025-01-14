import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'customer_model.dart';
import 'finished_customers_manager.dart';

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
    String? id,
    required String? name,
    required String? type,
    required String? price,
    required bool? isAvailable,
    this.customer,
  })  : id = id ?? const Uuid().v1(),
        name = name ?? "",
        type = type ?? "",
        price = price ?? "0.0",
        isAvailable = isAvailable ?? true;

  // Method to set a new customer
  Future<void> setCustomer(CustomerModel customer) async {
    this.customer = customer;
    await this.save();
  }

  // Method to remove the current customer and store them globally
  Future<void> removeCustomer() async {
    if (this.customer != null) {
      // Get the FinishedCustomersManager box
      var managerBox =
          Hive.box<FinishedCustomersManager>('finishedCustomersManagerBox');

      // Get the manager instance
      var manager = managerBox.get('manager');
      if (manager == null) {
        manager = FinishedCustomersManager();
        await managerBox.put('manager', manager);
      }

      // Add the customer to the manager
      await manager.addFinishedCustomer(this.customer!);

      this.customer = null;
      await this.save();
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
