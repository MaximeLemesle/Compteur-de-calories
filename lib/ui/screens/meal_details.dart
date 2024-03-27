import 'package:compteur_cal/models/aliment.dart';
import 'package:flutter/material.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final Aliment aliment =
        ModalRoute.of(context)!.settings.arguments as Aliment;

    return Scaffold(
      appBar: AppBar(
        title: Text(aliment.name),
        backgroundColor: const Color(0xFF16B576),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nom: ${aliment.name}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            // Text(
            //   'Calories: ${aliment.calories}',
            //   style: const TextStyle(fontSize: 18.0),
            // ),
            // const SizedBox(height: 8.0),
            // Text(
            //   'Taille de la portion: ${aliment.servingSize} g',
            //   style: const TextStyle(fontSize: 18.0),
            // ),
            // Ajoutez d'autres informations sur l'aliment ici
          ],
        ),
      ),
    );
  }
}
