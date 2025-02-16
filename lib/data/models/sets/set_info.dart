import 'package:json_annotation/json_annotation.dart';
import 'image_set_entity.dart';

part 'set_info.g.dart';

@JsonSerializable()
class SetInfo {
  final String id;
  final String name;
  final String series;
  final int? total;
  final String? releaseDate;
  final String? updatedAt;
  final ImageSetEntity? images;

  SetInfo({
    required this.id,
    required this.name,
    required this.series,
    required this.total,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });

  factory SetInfo.fromJson(Map<String, dynamic> json) => _$SetInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SetInfoToJson(this);
}
