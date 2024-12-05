import 'image_set_entity.dart';

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

  factory SetInfo.fromJson(Map<String, dynamic> json) {
    return SetInfo(
      id: json['id'],
      name: json['name'],
      series: json['series'],
      total: json['total'],
      releaseDate: json['releaseDate'],
      updatedAt: json['updatedAt'],
      images: json['images'] != null ? ImageSetEntity.fromJson(json['images']) : null,
    );
  }
}