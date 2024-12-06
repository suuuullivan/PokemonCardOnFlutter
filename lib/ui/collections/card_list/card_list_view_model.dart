import 'package:flutter/material.dart';
import '../../../data/api/api_service.dart';
import '../../../data/models/pokemon_card.dart';

class CardListViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<PokemonCard> _cards = [];
  List<PokemonCard> get cards => _cards;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCards(String setId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final allCards = await _apiService.fetchPokemonCardsBySet(setId);
      _cards = allCards.where((card) => card.id.isNotEmpty).toList();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}