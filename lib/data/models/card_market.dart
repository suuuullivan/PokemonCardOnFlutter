import 'package:json_annotation/json_annotation.dart';
import 'card_market_prices.dart';

part 'card_market.g.dart';

@JsonSerializable(explicitToJson: true)
class Cardmarket {
  final String? url;
  final String? updatedAt;
  final CardmarketPrices? prices;

  Cardmarket({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  factory Cardmarket.fromJson(Map<String, dynamic> json) => _$CardmarketFromJson(json);
  Map<String, dynamic> toJson() => _$CardmarketToJson(this);
}
