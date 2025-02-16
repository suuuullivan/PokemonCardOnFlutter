// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_market_prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardmarketPrices _$CardmarketPricesFromJson(Map<String, dynamic> json) =>
    CardmarketPrices(
      averageSellPrice: (json['averageSellPrice'] as num).toDouble(),
      lowPrice: (json['lowPrice'] as num).toDouble(),
      trendPrice: (json['trendPrice'] as num).toDouble(),
      avg1: (json['avg1'] as num).toDouble(),
      avg7: (json['avg7'] as num).toDouble(),
      avg30: (json['avg30'] as num).toDouble(),
    );

Map<String, dynamic> _$CardmarketPricesToJson(CardmarketPrices instance) =>
    <String, dynamic>{
      'averageSellPrice': instance.averageSellPrice,
      'lowPrice': instance.lowPrice,
      'trendPrice': instance.trendPrice,
      'avg1': instance.avg1,
      'avg7': instance.avg7,
      'avg30': instance.avg30,
    };
