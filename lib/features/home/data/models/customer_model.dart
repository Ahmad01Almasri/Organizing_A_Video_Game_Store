import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 2)
class CustomerModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  DateTime? selectedTime;

  CustomerModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.selectedTime,
  });

  factory CustomerModel.create({
    required String? name,
    required DateTime? selectedTime,
  }) =>
      CustomerModel(
        id: const Uuid().v1(),
        name: name ?? "",
        createdAt: DateTime.now(),
        selectedTime: selectedTime,
      );
}
