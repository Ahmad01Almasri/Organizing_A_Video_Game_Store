import 'package:flutter/material.dart';
import 'package:game_store/core/theming/app_colors.dart';
import 'package:game_store/core/theming/app_text_styles.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; // لتنسيق التاريخ
import '../../data/models/customer_model.dart';
import '../../data/models/finished_customers_manager.dart';

class FinishedCustomersScreen extends StatelessWidget {
  const FinishedCustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final finishedCustomersBox =
        Hive.box<FinishedCustomersManager>('finishedCustomersManagerBox');
    final manager = finishedCustomersBox.get('manager');

    final finishedCustomers = manager?.getFinishedCustomers() ?? [];

    // Function to group customers by date
    Map<String, List<CustomerModel>> groupCustomersByDate() {
      Map<String, List<CustomerModel>> groupedCustomers = {};
      for (var customer in finishedCustomers) {
        String formattedDate =
            DateFormat('yyyy-MM-dd').format(customer.createdAt);
        if (groupedCustomers.containsKey(formattedDate)) {
          groupedCustomers[formattedDate]?.add(customer);
        } else {
          groupedCustomers[formattedDate] = [customer];
        }
      }
      return groupedCustomers;
    }

    // Function to calculate total price for a specific group of customers
    double calculateTotalPriceForDay(List<CustomerModel> customers) {
      return customers.fold(
          0, (sum, customer) => sum + (customer.totalPrice ?? 0));
    }

    final groupedCustomers = groupCustomersByDate();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الزبائن المنتهين',
            style: AppTextStyles.font20WhiteBold,
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: groupedCustomers.isEmpty
            ? const Center(
                child: Text(
                  'لا يوجد زبائن منتهين.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: groupedCustomers.length,
                itemBuilder: (context, index) {
                  String date = groupedCustomers.keys.elementAt(index);
                  List<CustomerModel> customers = groupedCustomers[date]!;

                  // Calculate total price for this date
                  double dailyTotal = calculateTotalPriceForDay(customers);

                  return Card(
                    color: AppColors.primaryColor,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ExpansionTile(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      title: Text(
                        'التاريخ: $date              المجموع: ${dailyTotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      children: customers.map((customer) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: AppColors.primaryColor,
                                    size: 40,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'الزبون: ${customer.name}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'الوقت: ${DateFormat(' kk:mm').format(customer.createdAt)}',
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'المبلغ: ${customer.totalPrice?.toStringAsFixed(1) ?? 'غير متوفر'}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              height: 20,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Calculate total price and show dialog
            double totalPrice = finishedCustomers.fold(
                0, (sum, customer) => sum + (customer.totalPrice ?? 0));

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('المجموع الكلي'),
                  content: Text(
                    'المجموع الكلي لجميع الزبائن: ${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('حسنًا'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          backgroundColor: AppColors.primaryColor,
          child: const Text("الجرد"),
        ),
      ),
    );
  }
}
