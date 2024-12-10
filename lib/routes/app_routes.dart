import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/ui/card_information/card_information_screen.dart';

import '../ui/collections/card_list/card_list_screen.dart';
import '../ui/collections/home_screen.dart';

class AppRoutes {
  static const String homeScreen = '/';
  static const String cardListScreen = '/cards';
  static const String cardInformationScreen = '/card-info';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case cardListScreen:
        return MaterialPageRoute(
          builder: (_) => const CardListScreen(
            setId: '',
            setImageWithUrl: '',
          ),
        );
      case cardInformationScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => CardInformationScreen(
            card: args['card'],
            setImageUrl: args['setImageUrl'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
