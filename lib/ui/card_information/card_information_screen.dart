import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_card_on_flutter/ui/card_information/card_information_view_model.dart';
import '../../data/models/pokemon_card.dart';
import 'card_widget/container_picture_card.dart';
import 'card_widget/container_price_card.dart';
import 'card_widget/container_information_card.dart';
import 'card_widget/title_card.dart';
import 'card_widget/button_cardmarket.dart';

class CardInformationScreen extends StatelessWidget {
  final PokemonCard card;
  final String setImageUrl;

  const CardInformationScreen({
    super.key,
    required this.card,
    required this.setImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardInformationViewModel(),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerPictureCard(card: card),
              const SizedBox(height: 16),
              TitleCard(card: card),
              const SizedBox(height: 16),
              ContainerPriceCard(card: card),
              const SizedBox(height: 16),
              ContainerInformationCard(
                card: card,
                setImageWithUrl: setImageUrl,
              ),
              const SizedBox(height: 16),
              ButtonCardMarket(urlCardMarket: card.cardmarket?.url ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
