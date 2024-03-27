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
      body: Column(
        children: [
          Image.network(
            'https://img.spoonacular.com/ingredients_100x100/${aliment.image}',
          )
        ],
      ),
    );
  }
}
