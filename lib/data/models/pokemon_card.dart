import 'package:pokemon_card_on_flutter/data/models/sets/set_info.dart';
import 'card_market.dart';

class PokemonCard {
  final String id;
  final String name;
  final String supertype;
  final List<String> subtypes;
  final List<String> types;
  final String? artist;
  final String? cardImageUrl;
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
      setInfo: json['set'] != null ? SetInfo.fromJson(json['set']) : null,
      cardmarket: json['cardmarket'] != null ? Cardmarket.fromJson(json['cardmarket']) : null,
    );
  }
}