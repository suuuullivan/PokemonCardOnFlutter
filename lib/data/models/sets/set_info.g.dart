// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetInfo _$SetInfoFromJson(Map<String, dynamic> json) => SetInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      series: json['series'] as String,
      total: (json['total'] as num?)?.toInt(),
      releaseDate: json['releaseDate'] as String?,
      updatedAt: json['updatedAt'] as String?,
      images: json['images'] == null
          ? null
          : ImageSetEntity.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetInfoToJson(SetInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'series': instance.series,
      'total': instance.total,
      'releaseDate': instance.releaseDate,
      'updatedAt': instance.updatedAt,
      'images': instance.images?.toJson(),
    };
