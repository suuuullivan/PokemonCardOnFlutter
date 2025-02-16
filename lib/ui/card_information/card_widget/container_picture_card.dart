import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../themes/app_theme.dart';
import '../../../data/models/pokemon_card.dart';
import '../card_information_view_model.dart';

class ContainerPictureCard extends StatelessWidget {
  final PokemonCard card;

  const ContainerPictureCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CardInformationViewModel>();

    return GestureDetector(
      onPanUpdate: (details) {
        viewModel.updateRotation(details.delta.dx, details.delta.dy);
      },
      child: Column(
        children: [
          Transform(
            transform: Matrix4.identity()
              ..rotateX(viewModel.rotationX)
              ..rotateY(viewModel.rotationY),
            alignment: Alignment.center,
            child: Image.network(
              card.cardImageUrl!,
              height: 400,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                value: viewModel.isLocked,
                onChanged: viewModel.toggleLock,
              ),
              const SizedBox(width: 4),
              const Text('Lock card rotation',
                  style: AppTheme.fontBoldAppPokemon),
            ],
          ),
        ],
      ),
    );
  }
}
