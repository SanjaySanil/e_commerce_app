// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBModelAdapter extends TypeAdapter<DBModel> {
  @override
  final int typeId = 1;

  @override
  DBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBModel(
      rating: fields[2] as double,
      price: fields[1] as double,
      title: fields[4] as String,
      category: fields[0] as String,
      url: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DBModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
