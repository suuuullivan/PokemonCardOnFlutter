import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../themes/app_theme.dart';
import '../card_information/card_information_screen.dart';
import 'favoris_widget/favorite_search_bar.dart';
import 'favoris_widget/filter_bottom_sheet.dart';
import 'favoris_widget/filter_selection_sheet.dart';
import 'favorites_view_model.dart';
import 'filters_view_model.dart';

class CardListFavorisScreen extends StatefulWidget {
  const CardListFavorisScreen({super.key});

  @override
  _CardListFavorisScreenState createState() => _CardListFavorisScreenState();
}

class _CardListFavorisScreenState extends State<CardListFavorisScreen> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  Map<String, List<String>> activeFilters = {
    "Subtype": [],
    "Type": [],
    "Supertype": [],
  };

  void _showFilterSelectionSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => FilterSelectionSheet(
        onFilterCategorySelected: (category) {
          _showFilterBottomSheet(category);
        },
      ),
    );
  }

  void _showFilterBottomSheet(String category) {
    final filtersViewModel = context.read<FiltersViewModel>();

    filtersViewModel.fetchFilters(category).then((_) {
      showModalBottomSheet(
        context: context,
        builder: (context) => Consumer<FiltersViewModel>(
          builder: (context, filtersViewModel, child) {
            return FilterBottomSheet(
              filterCategory: category,
              selectedFilters: activeFilters[category]!,
              onFiltersSelected: (selected) {
                setState(() {
                  activeFilters[category] = selected;
                });
              },
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text('Your Wishlist', style: AppTheme.titleAppPokemon),
      ),
      body: Consumer<FavoritesViewModel>(
        builder: (context, favoritesViewModel, child) {
          final filteredFavorites = favoritesViewModel.favorites.where((card) {
            final matchesSearch =
                card.name.toLowerCase().contains(searchQuery.toLowerCase());
            final matchesFilters = activeFilters.entries.every((entry) =>
                entry.value.isEmpty ||
                entry.value.any((filter) =>
                    card.types.contains(filter) ||
                    card.subtypes.contains(filter) ||
                    card.supertype.contains(filter)));
            return matchesSearch && matchesFilters;
          }).toList();

          return Column(
            children: [
              FavoriteSearchBar(
                controller: searchController,
                onClear: () {
                  setState(() {
                    searchController.clear();
                    searchQuery = "";
                  });
                },
                onChanged: (value) => setState(() => searchQuery = value),
                onFilterPressed: _showFilterSelectionSheet,
              ),
              Wrap(
                children: activeFilters.entries
                    .expand((entry) => entry.value.map((filter) {
                          return Chip(
                            label: Text(filter),
                            deleteIcon: const Icon(Icons.close),
                            onDeleted: () {
                              setState(() {
                                activeFilters[entry.key]!.remove(filter);
                              });
                            },
                          );
                        }))
                    .toList(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  // Ajout de marge sur les côtés
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: filteredFavorites.length,
                    itemBuilder: (context, index) {
                      final card = filteredFavorites[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                body: CardInformationScreen(
                                  card: card,
                                  setImageUrl: card.setInfo?.images?.logo ?? '',
                                ),
                              ),
                            ),
                          );
                        },
                        child: Image.network(
                          card.cardImageUrl ?? "",
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
