import 'package:flutter/material.dart';
import '../card_list/card_list_screen.dart';
import '../../../data/models/sets/set_info.dart';
import '../../../themes/app_color.dart';
import '../../../themes/app_theme.dart';

class CollectionGrid extends StatelessWidget {
  final List<SetInfo> sets;

  const CollectionGrid({super.key, required this.sets});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: sets.length,
      itemBuilder: (context, index) {
        final set = sets[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardListScreen(setId: set.id, setImageWithUrl: set.images!.logo),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (set.images?.logo != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                      set.images!.logo,
                      width: double.infinity,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              else
                const SizedBox(
                  height: 80,
                  child: Icon(Icons.image_not_supported),
                ),
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: AppColor.mediumBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '0/${set.total ?? 0}',
                      style: AppTheme.TextBottomBarOnCardAppPokemon,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}