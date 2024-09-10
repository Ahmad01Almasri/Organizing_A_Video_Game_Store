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
    String? id,
    required this.name,
    DateTime? createdAt,
    required this.selectedTime,
  })  : id = id ?? const Uuid().v1(),
        createdAt = createdAt ?? DateTime.now();
}
