import 'dart:async';
import 'package:compteur_cal/models/aliment.dart';
import 'package:compteur_cal/repositories/aliment_repository.dart';
import 'package:flutter/material.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  static List<Aliment> _aliments = [];
  Timer? _searchTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar --- //
      appBar: AppBar(
        title: Text(
          'Ajouter un aliment',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // --- Recherche des aliments --- //
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
                labelText: 'Rechercher un aliment',
              ),

              // --- Timer --- //
              onChanged: (value) {
                if (_searchTimer != null) {
                  _searchTimer!.cancel();
                }
                _searchTimer = Timer(
                  const Duration(milliseconds: 500),
                  () async {
                    if (value.length >= 3) {
                      final result =
                          await AlimentRepository().fetchAliments(value);
                      setState(() {
                        _aliments = result;
                      });
                    }
                  },
                );
              },
            ),

            // --- Affichage des résultat de l'API --- //
            Expanded(
              child: ListView.separated(
                itemCount: _aliments.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(
                        'https://img.spoonacular.com/ingredients_100x100/${_aliments[index].image}',
                        width: 60,
                        fit: BoxFit.fitHeight,
                      ),
                      title: Text(
                        _aliments[index].name.capitalize(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      subtitle: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('calories'),
                          Text('protein'),
                          Text('lipides'),
                        ],
                      ),
                      onTap: () async {
                        /// Aller sur une page avec les infos complètes du produits
                        await Navigator.pushNamed(
                          context,
                          '/meal_details',
                          arguments: _aliments[index],
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ajout d'une majuscule au début d'une chaine de caractère
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
