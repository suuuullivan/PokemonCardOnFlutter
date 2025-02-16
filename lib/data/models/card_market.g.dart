// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cardmarket _$CardmarketFromJson(Map<String, dynamic> json) => Cardmarket(
      url: json['url'] as String?,
      updatedAt: json['updatedAt'] as String?,
      prices: json['prices'] == null
          ? null
          : CardmarketPrices.fromJson(json['prices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardmarketToJson(Cardmarket instance) =>
    <String, dynamic>{
      'url': instance.url,
      'updatedAt': instance.updatedAt,
      'prices': instance.prices,
    };
