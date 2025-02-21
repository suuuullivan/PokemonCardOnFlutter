import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/ui/collections/card_list/card_list_screen.dart';
import 'package:pokemon_card_on_flutter/themes/app_theme.dart';
import 'collection_widget/collection_grid.dart';
import 'collection_widget/custom_search_bar.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _navigateToCardList(String setId, String setImageWithUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CardListScreen(
          setId: setId,
          setImageWithUrl: setImageWithUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Your Collection',
          style: AppTheme.titleAppPokemon,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchBar(
              controller: viewModel.searchController,
              hintText: 'Search collection',
              onClear: () {
                viewModel.searchController.clear();
                viewModel.filterSets();
              },
              onChanged: (value) {
                viewModel.filterSets();
              },
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: AnimatedBuilder(
                animation: viewModel,
                builder: (context, _) {
                  if (viewModel.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (viewModel.error != null) {
                    return Center(child: Text(viewModel.error!));
                  } else if (viewModel.filteredSets.isEmpty) {
                    return const Center(child: Text('No collections found.'));
                  } else {
                    return CollectionGrid(
                      sets: viewModel.filteredSets,
                      onSetSelected: _navigateToCardList,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
