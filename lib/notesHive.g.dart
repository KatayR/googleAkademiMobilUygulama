// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notesHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notesHiveAdapter extends TypeAdapter<notesHive> {
  @override
  final int typeId = 1;

  @override
  notesHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notesHive(
      title: fields[0] as String,
      note: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, notesHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notesHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
