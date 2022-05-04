// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memos.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemosAdapter extends TypeAdapter<Memos> {
  @override
  final int typeId = 0;

  @override
  Memos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Memos(
      text: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Memos obj) {
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
      other is MemosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
