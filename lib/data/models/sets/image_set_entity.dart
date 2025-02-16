import 'package:json_annotation/json_annotation.dart';

part 'image_set_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ImageSetEntity {
  final String symbol;
  final String logo;

  ImageSetEntity({
    required this.symbol,
    required this.logo,
  });

  factory ImageSetEntity.fromJson(Map<String, dynamic> json) => _$ImageSetEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSetEntityToJson(this);
}
