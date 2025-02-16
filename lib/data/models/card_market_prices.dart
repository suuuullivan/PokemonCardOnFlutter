import 'package:json_annotation/json_annotation.dart';

part 'card_market_prices.g.dart';

@JsonSerializable()
class CardmarketPrices {
  final double averageSellPrice;
  final double lowPrice;
  final double trendPrice;
  final double avg1;
  final double avg7;
  final double avg30;

  CardmarketPrices({
    required this.averageSellPrice,
    required this.lowPrice,
    required this.trendPrice,
    required this.avg1,
    required this.avg7,
    required this.avg30,
  });

  factory CardmarketPrices.fromJson(Map<String, dynamic> json) => _$CardmarketPricesFromJson(json);
  Map<String, dynamic> toJson() => _$CardmarketPricesToJson(this);
}
