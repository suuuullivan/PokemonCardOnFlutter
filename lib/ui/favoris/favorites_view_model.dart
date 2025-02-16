import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../data/models/pokemon_card.dart';

class FavoritesViewModel extends ChangeNotifier {
  List<PokemonCard> _favorites = [];
  List<PokemonCard> get favorites => _favorites;

  FavoritesViewModel() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteCards = prefs.getStringList('favorite_cards') ?? [];

    _favorites = favoriteCards.map((jsonString) {
      final jsonData = json.decode(jsonString);

      // ✅ S'assurer que `setInfo` et `images` sont bien reconstruits
      return PokemonCard.fromJson(jsonData);
    }).toList();

    notifyListeners();
  }

  Future<void> toggleFavorite(PokemonCard card) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteCards = prefs.getStringList('favorite_cards') ?? [];

    if (_favorites.any((fav) => fav.id == card.id)) {
      _favorites.removeWhere((fav) => fav.id == card.id);
      favoriteCards.removeWhere((jsonString) {
        final jsonData = json.decode(jsonString);
        return jsonData['id'] == card.id;
      });
    } else {
      _favorites.add(card);

      // ✅ On sauvegarde la carte avec ses informations correctement
      favoriteCards.add(json.encode(card.toJson()));
    }

    await prefs.setStringList('favorite_cards', favoriteCards);
    notifyListeners();
  }

  bool isFavorite(String cardId) {
    return _favorites.any((card) => card.id == cardId);
  }
}
