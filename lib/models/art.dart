import 'package:art_crimes/models/image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'art.freezed.dart';

part 'art.g.dart';

@freezed
abstract class Art with _$Art {
  @HiveType(typeId: 0, adapterName: 'ArtAdapter')
  const factory Art({
    @HiveField(0) String? title,
    @HiveField(1) String? description,
    @HiveField(2) List<Image>? images,
    @HiveField(3) String? crimeCategory,
    @HiveField(4) String? maker,
    @HiveField(5) String? materials,
    @HiveField(6) String? measurements,
    @HiveField(7) String? period,
    @HiveField(8) String? additionalData,
  }) = _Art;

  factory Art.fromJson(Map<String, dynamic> json) => _$ArtFromJson(json);
}
