import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../collection_widget/custom_title.dart';
import 'card_list_view_model.dart';

class CardListScreen extends StatelessWidget {
  final String setId;
  final String setImageSetUrl;

  const CardListScreen(
      {Key? key, required this.setId, required this.setImageSetUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardListViewModel()..fetchCards(setId),
      child: Scaffold(
          body: Column(
        children: [
          CustomTitle(
            title: 'Your Collection',
            imageUrl: setImageSetUrl,
          ),
          Expanded(
            child: Consumer<CardListViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (viewModel.errorMessage != null) {
                  return Center(
                      child: Text('Erreur : ${viewModel.errorMessage}'));
                } else if (viewModel.cards.isEmpty) {
                  return const Center(child: Text('Aucune carte trouvée.'));
                }

                final cards = viewModel.cards;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 6.0,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      return Container(
                        constraints: const BoxConstraints(
                          maxHeight: 500,
                          minHeight: 300,
                        ),
                        child: card.cardImageUrl != null
                            ? Image.network(
                                card.cardImageUrl!,
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.image_not_supported, size: 120),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}