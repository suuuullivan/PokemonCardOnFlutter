import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/ui/card_information/card_information_view_model.dart';
import 'package:pokemon_card_on_flutter/ui/card_information/card_widget/button_cardmarket.dart';
import 'package:pokemon_card_on_flutter/ui/card_information/card_widget/container_picture_card.dart';
import 'package:pokemon_card_on_flutter/ui/card_information/card_widget/container_price_card.dart';
import '../../data/models/pokemon_card.dart';
import 'card_widget/container_information_card.dart';
import 'card_widget/title_card.dart';

class CardInformationScreen extends StatefulWidget {
  final PokemonCard card;
  final String setImageUrl;

  const CardInformationScreen({
    super.key,
    required this.card,
    required this.setImageUrl,
  });

  @override
  _CardInformationScreenState createState() => _CardInformationScreenState();
}

class _CardInformationScreenState extends State<CardInformationScreen> {
  late CardInformationViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CardInformationViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerPictureCard(card: widget.card),
              const SizedBox(height: 16),
              TitleCard(card: widget.card),
              const SizedBox(height: 16),
              ContainerPriceCard(card: widget.card),
              const SizedBox(height: 16),
              ContainerInformationCard(
                card: widget.card,
                setImageWithUrl: widget.setImageUrl,
              ),
              const SizedBox(height: 16),
              ButtonCardMarket(urlCardMarket: widget.card.cardmarket?.url ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
