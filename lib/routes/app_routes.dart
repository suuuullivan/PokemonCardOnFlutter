import 'package:flutter/material.dart';
import '../ui/collections/card_list/card_list_screen.dart';
import '../ui/collections/home_screen.dart';

class AppRoutes {
  static const String homeScreen = '/';
  static const String cardListScreen = '/cards';
  static Map<String, WidgetBuilder> get routes => {
    homeScreen: (context) => HomeScreen(),
    cardListScreen: (context) => const CardListScreen(setId: '', setImageSetUrl: ''),
  };
}