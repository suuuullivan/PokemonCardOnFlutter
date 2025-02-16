part of 'image_set_entity.dart';

ImageSetEntity _$ImageSetEntityFromJson(Map<String, dynamic> json) =>
    ImageSetEntity(
      symbol: json['symbol'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$ImageSetEntityToJson(ImageSetEntity instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'logo': instance.logo,
    };
