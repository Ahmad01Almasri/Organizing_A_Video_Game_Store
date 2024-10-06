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

  @HiveField(4)
  double? totalPrice; // لتخزين السعر المحسوب

  @HiveField(5)
  List<int> prices; // قائمة تخزين أسعار الطلبيات

  CustomerModel({
    String? id,
    required this.name,
    DateTime? createdAt,
    required this.selectedTime,
    this.totalPrice, // يمكن إضافته اختيارياً
    List<int>? prices, // قائمة اختيارية للأسعار
  })  : id = id ?? const Uuid().v1(),
        createdAt = createdAt ?? DateTime.now(),
        prices = prices ?? []; // تهيئة قائمة الأسعار
}
