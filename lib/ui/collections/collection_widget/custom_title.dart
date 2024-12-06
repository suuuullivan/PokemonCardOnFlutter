import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/themes/app_theme.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CustomTitle({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: 0.15,
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 16,
          child: Text(title, style: AppTheme.titleAppPokemon),
        ),
      ],
    );
  }
}