// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonCard _$PokemonCardFromJson(Map<String, dynamic> json) => PokemonCard(
      id: json['id'] as String,
      name: json['name'] as String,
      supertype: json['supertype'] as String,
      subtypes: (json['subtypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      artist: json['artist'] as String?,
      images: json['images'] as Map<String, dynamic>? ?? {},
      positionCard: json['number'] as String?,
      setInfo: json['set'] == null
          ? null
          : SetInfo.fromJson(json['set'] as Map<String, dynamic>),
      cardmarket: json['cardmarket'] == null
          ? null
          : Cardmarket.fromJson(json['cardmarket'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonCardToJson(PokemonCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'supertype': instance.supertype,
      'subtypes': instance.subtypes,
      'types': instance.types,
      'artist': instance.artist,
      'number': instance.positionCard,
      'set': instance.setInfo?.toJson(),
      'cardmarket': instance.cardmarket?.toJson(),
      'images': instance.images,
    };
