// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caldata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalDataAdapter extends TypeAdapter<CalData> {
  @override
  final int typeId = 2;

  @override
  CalData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalData(
      checkState: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CalData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.checkState);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
