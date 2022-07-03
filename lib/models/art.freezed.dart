// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'art.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Art _$ArtFromJson(Map<String, dynamic> json) {
  return _Art.fromJson(json);
}

/// @nodoc
mixin _$Art {
  @HiveField(0)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(2)
  List<Image>? get images => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get crimeCategory => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get maker => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get materials => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get measurements => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get period => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get additionalData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtCopyWith<Art> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtCopyWith<$Res> {
  factory $ArtCopyWith(Art value, $Res Function(Art) then) =
      _$ArtCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? title,
      @HiveField(1) String? description,
      @HiveField(2) List<Image>? images,
      @HiveField(3) String? crimeCategory,
      @HiveField(4) String? maker,
      @HiveField(5) String? materials,
      @HiveField(6) String? measurements,
      @HiveField(7) String? period,
      @HiveField(8) String? additionalData});
}

/// @nodoc
class _$ArtCopyWithImpl<$Res> implements $ArtCopyWith<$Res> {
  _$ArtCopyWithImpl(this._value, this._then);

  final Art _value;
  // ignore: unused_field
  final $Res Function(Art) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? crimeCategory = freezed,
    Object? maker = freezed,
    Object? materials = freezed,
    Object? measurements = freezed,
    Object? period = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      crimeCategory: crimeCategory == freezed
          ? _value.crimeCategory
          : crimeCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      maker: maker == freezed
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String?,
      materials: materials == freezed
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as String?,
      measurements: measurements == freezed
          ? _value.measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as String?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: additionalData == freezed
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ArtCopyWith<$Res> implements $ArtCopyWith<$Res> {
  factory _$$_ArtCopyWith(_$_Art value, $Res Function(_$_Art) then) =
      __$$_ArtCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? title,
      @HiveField(1) String? description,
      @HiveField(2) List<Image>? images,
      @HiveField(3) String? crimeCategory,
      @HiveField(4) String? maker,
      @HiveField(5) String? materials,
      @HiveField(6) String? measurements,
      @HiveField(7) String? period,
      @HiveField(8) String? additionalData});
}

/// @nodoc
class __$$_ArtCopyWithImpl<$Res> extends _$ArtCopyWithImpl<$Res>
    implements _$$_ArtCopyWith<$Res> {
  __$$_ArtCopyWithImpl(_$_Art _value, $Res Function(_$_Art) _then)
      : super(_value, (v) => _then(v as _$_Art));

  @override
  _$_Art get _value => super._value as _$_Art;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? crimeCategory = freezed,
    Object? maker = freezed,
    Object? materials = freezed,
    Object? measurements = freezed,
    Object? period = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_$_Art(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      crimeCategory: crimeCategory == freezed
          ? _value.crimeCategory
          : crimeCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      maker: maker == freezed
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String?,
      materials: materials == freezed
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as String?,
      measurements: measurements == freezed
          ? _value.measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as String?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: additionalData == freezed
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'ArtAdapter')
class _$_Art implements _Art {
  const _$_Art(
      {@HiveField(0) this.title,
      @HiveField(1) this.description,
      @HiveField(2) final List<Image>? images,
      @HiveField(3) this.crimeCategory,
      @HiveField(4) this.maker,
      @HiveField(5) this.materials,
      @HiveField(6) this.measurements,
      @HiveField(7) this.period,
      @HiveField(8) this.additionalData})
      : _images = images;

  factory _$_Art.fromJson(Map<String, dynamic> json) => _$$_ArtFromJson(json);

  @override
  @HiveField(0)
  final String? title;
  @override
  @HiveField(1)
  final String? description;
  final List<Image>? _images;
  @override
  @HiveField(2)
  List<Image>? get images {
    final value = _images;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(3)
  final String? crimeCategory;
  @override
  @HiveField(4)
  final String? maker;
  @override
  @HiveField(5)
  final String? materials;
  @override
  @HiveField(6)
  final String? measurements;
  @override
  @HiveField(7)
  final String? period;
  @override
  @HiveField(8)
  final String? additionalData;

  @override
  String toString() {
    return 'Art(title: $title, description: $description, images: $images, crimeCategory: $crimeCategory, maker: $maker, materials: $materials, measurements: $measurements, period: $period, additionalData: $additionalData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Art &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other.crimeCategory, crimeCategory) &&
            const DeepCollectionEquality().equals(other.maker, maker) &&
            const DeepCollectionEquality().equals(other.materials, materials) &&
            const DeepCollectionEquality()
                .equals(other.measurements, measurements) &&
            const DeepCollectionEquality().equals(other.period, period) &&
            const DeepCollectionEquality()
                .equals(other.additionalData, additionalData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(crimeCategory),
      const DeepCollectionEquality().hash(maker),
      const DeepCollectionEquality().hash(materials),
      const DeepCollectionEquality().hash(measurements),
      const DeepCollectionEquality().hash(period),
      const DeepCollectionEquality().hash(additionalData));

  @JsonKey(ignore: true)
  @override
  _$$_ArtCopyWith<_$_Art> get copyWith =>
      __$$_ArtCopyWithImpl<_$_Art>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtToJson(this);
  }
}

abstract class _Art implements Art {
  const factory _Art(
      {@HiveField(0) final String? title,
      @HiveField(1) final String? description,
      @HiveField(2) final List<Image>? images,
      @HiveField(3) final String? crimeCategory,
      @HiveField(4) final String? maker,
      @HiveField(5) final String? materials,
      @HiveField(6) final String? measurements,
      @HiveField(7) final String? period,
      @HiveField(8) final String? additionalData}) = _$_Art;

  factory _Art.fromJson(Map<String, dynamic> json) = _$_Art.fromJson;

  @override
  @HiveField(0)
  String? get title => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get description => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  List<Image>? get images => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String? get crimeCategory => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get maker => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String? get materials => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  String? get measurements => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  String? get period => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  String? get additionalData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ArtCopyWith<_$_Art> get copyWith => throw _privateConstructorUsedError;
}
