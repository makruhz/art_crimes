// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageAdapter extends TypeAdapter<_$_Image> {
  @override
  final int typeId = 1;

  @override
  _$_Image read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Image(
      original: fields[0] as String?,
      thumb: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Image obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.original)
      ..writeByte(1)
      ..write(obj.thumb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      original: json['original'] as String?,
      thumb: json['thumb'] as String?,
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'original': instance.original,
      'thumb': instance.thumb,
    };
