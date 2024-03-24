import 'package:flutter/material.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar --- //
      appBar: AppBar(
        title: const Text('Ajouter un repas'),
        backgroundColor: const Color(0xFF16B576),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // --- Recherche des aliments --- //
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.restaurant_menu,
                  color: Theme.of(context).primaryColor,
                ),
                labelText: 'Rechercher un aliment',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
