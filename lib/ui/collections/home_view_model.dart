import 'package:flutter/material.dart';
import '../../data/api/api_service.dart';
import '../../data/models/sets/set_info.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();
  final TextEditingController searchController = TextEditingController();

  List<SetInfo> allSets = [];
  List<SetInfo> filteredSets = [];
  bool isLoading = false;
  String? error;

  HomeViewModel() {
    fetchSets();
    searchController.addListener(filterSets);
  }

  Future<void> fetchSets() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      allSets = await apiService.fetchSetImages();
      filteredSets = allSets;
    } catch (e) {
      error = 'Error : $e';
    }

    isLoading = false;
    notifyListeners();
  }

  void filterSets() {
    final query = searchController.text.toLowerCase();
    filteredSets = allSets
        .where((set) => set.name.toLowerCase().contains(query))
        .toList();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}