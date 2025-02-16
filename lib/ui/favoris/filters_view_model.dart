import 'package:flutter/material.dart';
import '../../data/api/api_service.dart';

class FiltersViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  Map<String, List<String>> filters = {
    "Subtype": [],
    "Type": [],
    "Supertype": [],
  };

  bool isLoading = false;

  Future<void> fetchFilters(String category) async {
    isLoading = true;
    notifyListeners();

    try {
      List<String> fetchedFilters = await _apiService.fetchFilters(category);
      filters[category] = fetchedFilters;
    } catch (e) {
      print("Erreur lors de la récupération des filtres $category: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
