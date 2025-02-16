import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../themes/app_theme.dart';
import '../card_information/card_information_screen.dart';
import 'favorites_view_model.dart';

class CardListFavorisScreen extends StatelessWidget {
  const CardListFavorisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Your Wishlist',
          style: AppTheme.titleAppPokemon,
        ),
      ),
      body: Consumer<FavoritesViewModel>(
        builder: (context, favoritesViewModel, child) {
          if (favoritesViewModel.favorites.isEmpty) {
            return const Center(child: Text("No favorite cards yet."));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: favoritesViewModel.favorites.length,
            itemBuilder: (context, index) {
              final card = favoritesViewModel.favorites[index];

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
                child: card.cardImageUrl != null && card.cardImageUrl!.isNotEmpty
                    ? Image.network(
                  card.cardImageUrl!,
                  fit: BoxFit.cover,
                )
                    : const Icon(Icons.image_not_supported, size: 120),
              );
            },
          );
        },
      ),
    );
  }
}
