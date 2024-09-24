import 'package:hive/hive.dart';
import 'customer_model.dart';

part 'finished_customers_manager.g.dart';

@HiveType(typeId: 3)
class FinishedCustomersManager extends HiveObject {
  @HiveField(0)
  List<CustomerModel> finishedCustomers = [];

  // Method to add a finished customer
  Future<void> addFinishedCustomer(CustomerModel customer) async {
    finishedCustomers.add(customer);
    await save();
  }

  // Method to get the list of finished customers
  List<CustomerModel> getFinishedCustomers() {
    return finishedCustomers;
  }
}
