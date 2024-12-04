import 'package:flutter/material.dart';
import '../views/home_screen.dart';

class AppRoutes {
  static const String homeScreen = '/';
  static Map<String, WidgetBuilder> get routes => {
    homeScreen: (context) => HomeScreen(),
  };
}