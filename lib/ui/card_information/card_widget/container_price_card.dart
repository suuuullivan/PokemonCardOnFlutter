import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/data/models/pokemon_card.dart';
import 'package:pokemon_card_on_flutter/themes/app_theme.dart';

class ContainerPriceCard extends StatelessWidget {
  final PokemonCard card;

  const ContainerPriceCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final lowPrice = card.cardmarket?.prices?.lowPrice ?? 0.0;
    final trendPrice = card.cardmarket?.prices?.trendPrice ?? 0.0;
    final averageSellPrice = card.cardmarket?.prices?.averageSellPrice ?? 0.0;

    Widget trendIcon(double price, double comparison) {
      if (price > comparison) {
        return const Icon(Icons.trending_up, color: Colors.green, size: 16);
      } else if (price < comparison) {
        return const Icon(Icons.trending_down, color: Colors.red, size: 16);
      } else {
        return const Icon(Icons.remove, color: Colors.blue, size: 16);
      }
    }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Price Last Update',
                  style: AppTheme.fontBoldAppPokemon),
              Text(card.cardmarket?.updatedAt ?? 'N/A',
                  style: AppTheme.fontLightAppPokemon),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Market Price', style: AppTheme.fontLightAppPokemon),
              Row(
                children: [
                  Text('${averageSellPrice.toStringAsFixed(2)}€',
                      style: AppTheme.fontBoldAppPokemon),
                  const SizedBox(width: 4),
                  trendIcon(averageSellPrice, trendPrice),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Mid Price', style: AppTheme.fontLightAppPokemon),
              Row(
                children: [
                  Text('${trendPrice.toStringAsFixed(2)}€',
                      style: AppTheme.fontBoldAppPokemon),
                  const SizedBox(width: 4),
                  trendIcon(trendPrice, lowPrice),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Low Price', style: AppTheme.fontLightAppPokemon),
              Row(
                children: [
                  Text('${lowPrice.toStringAsFixed(2)}€',
                      style: AppTheme.fontBoldAppPokemon),
                  const SizedBox(width: 4),
                  trendIcon(lowPrice, lowPrice),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
