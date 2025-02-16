import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/routes/app_routes.dart';
import 'package:pokemon_card_on_flutter/ui/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Card Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}