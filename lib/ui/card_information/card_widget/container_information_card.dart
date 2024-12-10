import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/data/models/pokemon_card.dart';

import '../../../themes/app_theme.dart';

class ContainerInformationCard extends StatelessWidget {
  final PokemonCard card;
  final String setImageWithUrl;

  const ContainerInformationCard(
      {super.key, required this.card, required this.setImageWithUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Set information',
            style: AppTheme.fontBoldAppPokemon
          ),
          const SizedBox(height: 8),
          Text('Number of cards: ${card.setInfo?.total}', style: AppTheme.fontLightAppPokemon,),
          const SizedBox(height: 8),
          Text('Position in set: ${card.positionCard}', style: AppTheme.fontLightAppPokemon),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('Logo: ', style: AppTheme.fontLightAppPokemon),
              Image.network(
                setImageWithUrl,
                width: 40,
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
