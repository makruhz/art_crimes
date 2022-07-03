// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArtAdapter extends TypeAdapter<_$_Art> {
  @override
  final int typeId = 0;

  @override
  _$_Art read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Art(
      title: fields[0] as String?,
      description: fields[1] as String?,
      images: (fields[2] as List?)?.cast<Image>(),
      crimeCategory: fields[3] as String?,
      maker: fields[4] as String?,
      materials: fields[5] as String?,
      measurements: fields[6] as String?,
      period: fields[7] as String?,
      additionalData: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Art obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.crimeCategory)
      ..writeByte(4)
      ..write(obj.maker)
      ..writeByte(5)
      ..write(obj.materials)
      ..writeByte(6)
      ..write(obj.measurements)
      ..writeByte(7)
      ..write(obj.period)
      ..writeByte(8)
      ..write(obj.additionalData)
      ..writeByte(2)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArtAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Art _$$_ArtFromJson(Map<String, dynamic> json) => _$_Art(
      title: json['title'] as String?,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      crimeCategory: json['crimeCategory'] as String?,
      maker: json['maker'] as String?,
      materials: json['materials'] as String?,
      measurements: json['measurements'] as String?,
      period: json['period'] as String?,
      additionalData: json['additionalData'] as String?,
    );

Map<String, dynamic> _$$_ArtToJson(_$_Art instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'crimeCategory': instance.crimeCategory,
      'maker': instance.maker,
      'materials': instance.materials,
      'measurements': instance.measurements,
      'period': instance.period,
      'additionalData': instance.additionalData,
    };
