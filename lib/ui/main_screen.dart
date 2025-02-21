import 'package:flutter/material.dart';
import 'package:pokemon_card_on_flutter/ui/collections/home_screen.dart';
import 'package:pokemon_card_on_flutter/ui/favoris/card_list_favoris_screen.dart';

class MainScreen extends StatefulWidget {
  final bool showBottomBar;
  final Widget? childScreen;

  const MainScreen({super.key, this.showBottomBar = true, this.childScreen});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: Navigator(
              onGenerateRoute: (settings) {
                return MaterialPageRoute(builder: (context) => const HomeScreen());
              },
            ),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: Navigator(
              onGenerateRoute: (settings) {
                return MaterialPageRoute(builder: (context) => CardListFavorisScreen());
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: widget.showBottomBar
          ? BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
        ],
      )
          : null,
    );
  }
}
