class ImageSetEntity {
  final String symbol;
  final String logo;

  ImageSetEntity({
    required this.symbol,
    required this.logo,
  });

  factory ImageSetEntity.fromJson(Map<String, dynamic> json) {
    return ImageSetEntity(
      symbol: json['symbol'],
      logo: json['logo'],
    );
  }
}
