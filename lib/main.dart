import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/ui/favoris/favorites_view_model.dart';
import 'package:pokemon_card_on_flutter/ui/favoris/filters_view_model.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_card_on_flutter/ui/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesViewModel()),
        ChangeNotifierProvider(create: (_) => FiltersViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Card Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}
