// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memodata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemoDataAdapter extends TypeAdapter<MemoData> {
  @override
  final int typeId = 0;

  @override
  MemoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemoData(
      text: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MemoData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
