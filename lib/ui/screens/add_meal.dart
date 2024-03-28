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
        title: const Text('Ajouter un repas'),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
                  return ListTile(
                    title: Text(
                      _aliments[index].name,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      /// Aller sur une page avec les infos complètes du produits
                      await Navigator.pushNamed(
                        context,
                        '/meal_details',
                        arguments: _aliments[index],
                      );
                    },
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
