import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/data/models/pokemon_card.dart';
import '../../../themes/app_theme.dart';

class ContainerPictureCard extends StatefulWidget {
  final PokemonCard card;

  const ContainerPictureCard({super.key, required this.card});

  @override
  _ContainerPictureCardState createState() => _ContainerPictureCardState();
}

class _ContainerPictureCardState extends State<ContainerPictureCard> {
  bool isLocked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          widget.card.cardImageUrl!,
          height: 400,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: isLocked,
              onChanged: (value) {
                setState(() {
                  isLocked = value;
                });
              },
            ),
            const SizedBox(width: 8),
            const Text(
              'Lock card rotation',
              style: AppTheme.fontBoldAppPokemon
            ),
          ],
        ),
      ],
    );
  }
}