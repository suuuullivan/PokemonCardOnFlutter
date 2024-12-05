import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_card.dart';
import '../models/sets/set_info.dart';

class ApiService {
  static const String baseUrl = 'https://api.pokemontcg.io/v2';
  static const String apiKey = 'c27ab667-a08b-4846-9670-31cb378d60ba';

  Future<List<PokemonCard>> fetchPokemonCards() async {
    final response = await http.get(
      Uri.parse('$baseUrl/cards'),
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return data.map((json) => PokemonCard.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des cartes Pokémon');
    }
  }

  Future<List<SetInfo>> fetchSetImages() async {
    final response = await http.get(
      Uri.parse('$baseUrl/sets'),
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return data.map((json) => SetInfo.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des sets');
    }
  }
}
