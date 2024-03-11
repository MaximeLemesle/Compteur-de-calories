import 'package:compteur_cal/ui/views/aliments_view.dart';
import 'package:compteur_cal/ui/views/calories_view.dart';
import 'package:compteur_cal/ui/views/recettes_view.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _viewsOptions = <Widget>[
    CalorieView(),
    AlimentView(),
    RecetteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar --- //
      appBar: AppBar(
        title: const Text('Calculateur de calories'),
        backgroundColor: const Color(0xFF16B576),
      ),

      // --- Content --- //
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: _viewsOptions.elementAt(_selectedIndex),
        ),
      ),

      // --- Bar de navigation --- //
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off),
            label: 'Calories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco_outlined),
            label: 'Aliments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recettes',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
} 
