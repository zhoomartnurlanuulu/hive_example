// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gadget_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GadgetModelAdapter extends TypeAdapter<GadgetModel> {
  @override
  final int typeId = 0;

  @override
  GadgetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GadgetModel(
      brand: fields[0] as String,
      model: fields[1] as String,
      type: fields[2] as String,
      price: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GadgetModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.brand)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GadgetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
