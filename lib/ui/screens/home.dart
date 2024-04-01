import 'package:compteur_cal/ui/views/repas_view.dart';
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
    RepasView(),
    CalorieView(),
    RecetteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar --- //
      appBar: AppBar(
        title: Text(
          'Activité journalière',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),

      // --- Content --- //
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: _viewsOptions.elementAt(_selectedIndex),
          ),
        ),
      ),

      // --- Bar de navigation --- //
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off),
            label: 'Statistiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Calories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dining_outlined),
            label: 'Repas',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
