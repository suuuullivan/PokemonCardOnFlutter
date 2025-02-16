import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_card.dart';
import '../models/sets/set_info.dart';

class ApiService {
  static const String baseUrl = 'https://api.pokemontcg.io/v2';
  static const String apiKey = 'c27ab667-a08b-4846-9670-31cb378d60ba';

  Future<List<PokemonCard>> fetchPokemonCards({int page = 1}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/cards?page=$page'),
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      final data = decoded['data'];
      if (data == null) {
        return [];
      }
      if (data is! List) {
        return [];
      }

      return data.map((json) => PokemonCard.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des cartes Pokémon');
    }
  }


  Future<List<SetInfo>> fetchSetImages({int page = 1}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/sets?page=$page'),
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final data = decoded['data'];
      if (data == null || data is! List) {
        return [];
      }
      return data.map((json) => SetInfo.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des sets');
    }
  }

  Future<List<PokemonCard>> fetchPokemonCardsBySet(String setId, {int page = 1}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/cards?q=set.id:$setId&orderBy=number&page=$page'),
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      final data = decoded['data'];
      if (data == null || data is! List) {
        print("Erreur : le champ 'data' est null ou non valide");
        return [];
      }

      return data.map((json) => PokemonCard.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des cartes pour le set $setId');
    }
  }

  Future<List<PokemonCard>> fetchAllPokemonCards() async {
    List<PokemonCard> allCards = [];
    int page = 1;

    while (true) {
      final response = await http.get(
        Uri.parse('$baseUrl/cards?page=$page'),
        headers: {'X-Api-Key': apiKey},
      );

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);

        final data = decoded['data'];
        if (data == null || data is! List) {
          break;
        }

        final cards = data.map((json) => PokemonCard.fromJson(json)).toList();
        allCards.addAll(cards);

        if (cards.isEmpty) break;

        page++;
      } else {
        throw Exception('Erreur lors de la récupération des cartes Pokémon (Page $page)');
      }
    }
    return allCards;
  }

  Future<List<String>> fetchFilters(String filterCategory) async {
    final response = await http.get(
      Uri.parse('$baseUrl/${filterCategory.toLowerCase()}s'),
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final data = decoded['data'];

      if (data == null || data is! List) {
        return [];
      }

      return List<String>.from(data);
    } else {
      throw Exception('Erreur lors de la récupération des filtres $filterCategory');
    }
  }

}