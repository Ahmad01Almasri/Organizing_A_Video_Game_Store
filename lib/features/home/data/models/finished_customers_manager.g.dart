// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_customers_manager.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinishedCustomersManagerAdapter
    extends TypeAdapter<FinishedCustomersManager> {
  @override
  final int typeId = 3;

  @override
  FinishedCustomersManager read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinishedCustomersManager()
      ..finishedCustomers = (fields[0] as List).cast<CustomerModel>();
  }

  @override
  void write(BinaryWriter writer, FinishedCustomersManager obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.finishedCustomers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinishedCustomersManagerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
