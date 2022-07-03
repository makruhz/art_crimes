import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
abstract class Image with _$Image {
  @HiveType(typeId: 1, adapterName: 'ImageAdapter')
  const factory Image({
    @HiveField(0) String? original,
    @HiveField(1) String? thumb,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
