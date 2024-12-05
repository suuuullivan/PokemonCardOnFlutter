class Cardmarket {
  final String? url;
  final String? updatedAt;
  final CardmarketPrices? prices;

  Cardmarket({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  factory Cardmarket.fromJson(Map<String, dynamic> json) {
    return Cardmarket(
      url: json['url'],
      updatedAt: json['updatedAt'],
      prices: json['prices'] != null ? CardmarketPrices.fromJson(json['prices']) : null,
    );
  }
}

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

  factory CardmarketPrices.fromJson(Map<String, dynamic> json) {
    return CardmarketPrices(
      averageSellPrice: json['averageSellPrice']?.toDouble() ?? 0.0,
      lowPrice: json['lowPrice']?.toDouble() ?? 0.0,
      trendPrice: json['trendPrice']?.toDouble() ?? 0.0,
      avg1: json['avg1']?.toDouble() ?? 0.0,
      avg7: json['avg7']?.toDouble() ?? 0.0,
      avg30: json['avg30']?.toDouble() ?? 0.0,
    );
  }
}
