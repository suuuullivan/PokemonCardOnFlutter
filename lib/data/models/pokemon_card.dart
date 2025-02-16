import 'package:json_annotation/json_annotation.dart';
import 'sets/set_info.dart';
import 'card_market.dart';

part 'pokemon_card.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonCard {
  final String id;
  final String name;
  final String supertype;
  @JsonKey(defaultValue: [])
  final List<String> subtypes;
  @JsonKey(defaultValue: [])
  final List<String> types;
  final String? artist;
  @JsonKey(name: 'number')
  final String? positionCard;
  @JsonKey(name: 'set')
  final SetInfo? setInfo;
  final Cardmarket? cardmarket;

  @JsonKey(name: 'images', defaultValue: {})
  final Map<String, dynamic> images;

  PokemonCard({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.types,
    required this.artist,
    required this.images,
    required this.positionCard,
    required this.setInfo,
    required this.cardmarket,
  });

  factory PokemonCard.fromJson(Map<String, dynamic> json) => _$PokemonCardFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonCardToJson(this);

  String? get cardImageUrl => images.containsKey('small') ? images['small'] as String : null;
}
