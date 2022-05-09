// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caldata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalDataAdapter extends TypeAdapter<CalData> {
  @override
  final int typeId = 0;

  @override
  CalData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalData(
      text: fields[0] as String?,
      finished: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CalData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.finished);
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
