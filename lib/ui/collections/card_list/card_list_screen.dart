import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../card_information/card_information_screen.dart';
import '../collection_widget/custom_title.dart';
import 'card_list_view_model.dart';

class CardListScreen extends StatelessWidget {
  final String setId;
  final String setImageWithUrl;

  const CardListScreen(
      {Key? key, required this.setId, required this.setImageWithUrl})
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
            imageUrl: setImageWithUrl,
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
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CardInformationScreen(
                                  card: card,
                                  setImageUrl: setImageWithUrl,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            constraints: const BoxConstraints(
                              maxHeight: 500,
                              minHeight: 300,
                            ),
                            child: card.cardImageUrl != null
                                ? Image.network(
                                    card.cardImageUrl!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image_not_supported,
                                    size: 120),
                          ));
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
