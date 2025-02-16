import 'package:json_annotation/json_annotation.dart';
import 'sets/set_info.dart';
import 'card_market.dart';

part 'pokemon_card.g.dart';

@JsonSerializable(explicitToJson: true) // ✅ Permet de sérialiser tous les objets imbriqués
class PokemonCard {
  final String id;
  final String name;
  final String supertype;
  @JsonKey(defaultValue: [])
  final List<String> subtypes;
  @JsonKey(defaultValue: [])
  final List<String> types;
  final String? artist;
  final String? cardImageUrl;
  final String? positionCard;
  final SetInfo? setInfo;
  final Cardmarket? cardmarket;

  PokemonCard({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.types,
    required this.artist,
    required this.cardImageUrl,
    required this.positionCard,
    required this.setInfo,
    required this.cardmarket,
  });

  factory PokemonCard.fromJson(Map<String, dynamic> json) {
    return PokemonCard(
      id: json['id'],
      name: json['name'],
      supertype: json['supertype'],
      subtypes: List<String>.from(json['subtypes'] ?? []),
      types: List<String>.from(json['types'] ?? []),
      artist: json['artist'],
      cardImageUrl: json['images']?['small'],
      positionCard: json['number'],
      setInfo: json['set'] != null ? SetInfo.fromJson(json['set']) : null,
      cardmarket: json['cardmarket'] != null ? Cardmarket.fromJson(json['cardmarket']) : null,
    );
  }

  Map<String, dynamic> toJson() => _$PokemonCardToJson(this);
}
