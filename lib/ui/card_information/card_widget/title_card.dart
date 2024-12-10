import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/data/models/pokemon_card.dart';
import 'package:pokemon_card_on_flutter/themes/app_theme.dart';

import '../../../data/models/card_type_gradients.dart';

class TitleCard extends StatelessWidget {
  final PokemonCard card;

  const TitleCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final gradient = CardTypeGradients.findGradient(card.types[0]);
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
            const Text(
              "from ",
              style: AppTheme.fontLightAppPokemon,
            ),
            Text(card.artist ?? "Unknown", style: AppTheme.fontBoldAppPokemon),
          ],
        ),
      ],
    );
  }
}
