import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/pokemon_card.dart';
import '../../../themes/app_theme.dart';
import '../../../data/models/card_type_gradients.dart';
import '../../favoris/favorites_view_model.dart';

class TitleCard extends StatelessWidget {
  final PokemonCard card;

  const TitleCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final gradient = CardTypeGradients.findGradient(card.types[0]);
    final favoritesViewModel = Provider.of<FavoritesViewModel>(context);

    bool isFavorite = favoritesViewModel.isFavorite(card.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(card.name, style: AppTheme.fontBoldAppPokemon),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [gradient.colorStart, gradient.colorEnd],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(card.types[0], style: AppTheme.fontBoldAppPokemon),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("from ", style: AppTheme.fontLightAppPokemon),
            Text(card.artist ?? "Unknown", style: AppTheme.fontBoldAppPokemon),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () {
            favoritesViewModel.toggleFavorite(card);
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.pink : Colors.black,
          ),
          label: Text(
            isFavorite ? "Remove from Wishlist" : "Add to Wishlist",
            style: TextStyle(color: isFavorite ? Colors.pink : Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(color: isFavorite ? Colors.pink : Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
