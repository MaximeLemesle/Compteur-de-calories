import 'package:compteur_cal/ui/widget/aliment_card.dart';
import 'package:compteur_cal/ui/widget/button.dart';
import 'package:compteur_cal/ui/widget/nutriments_box.dart';
import 'package:compteur_cal/ui/theme/app_theme.dart';
import 'package:compteur_cal/ui/widget/progress_circle.dart';
import 'package:flutter/material.dart';

class CalorieView extends StatefulWidget {
  const CalorieView({super.key});

  @override
  State<CalorieView> createState() => _CalorieViewState();
}

class _CalorieViewState extends State<CalorieView> {
  /// Liste des macronutriments
  List<dynamic> nutriments = [
    // [ nutrimentsName, nutrimentsColor, nutrimentsProgress ]
    ["Glucides", AppTheme.pinkRose, .75],
    ["Protéines", AppTheme.skyBlue, .50],
    ["Lipides", AppTheme.mustardYellow, .10],
    ["Autres", AppTheme.blueViolet, .20],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// Affichage date du jour
        Container(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '30 mars',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),

        /// Affichage calories
        const Center(
          child: ProgressCircle(
            titleText: '1240',
            subtitleText: 'calories',
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        /// Affichage des macronutriments
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: nutriments.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.5 / 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            return NutrimentsBox(
              nutrimentsName: nutriments[index][0] as String,
              nutrimentsColor: nutriments[index][1] as Color,
              nutrimentsProgress: nutriments[index][2] as double,
            );
          },
        ),

        const SizedBox(
          height: 24,
        ),

        /// Liste des aliments du petit déjeuner
        Container(
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Petit Déjeuner',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  /// Button
                  Button(
                    onPressed: () async {
                      await Navigator.pushNamed(context, '/add_meal');
                    },
                    buttonText: 'Ajouter',
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),

              /// Aliment cards
              AlimentCard(
                colorBackground: Theme.of(context).colorScheme.background,
                alimentName: 'Banane',
                alimentWeight: '100g',
              ),

              const SizedBox(
                height: 8,
              ),

              AlimentCard(
                colorBackground: Theme.of(context).colorScheme.background,
                alimentName: 'Pancakes',
                alimentWeight: '250g',
              ),

              const SizedBox(
                height: 8,
              ),

              AlimentCard(
                colorBackground: Theme.of(context).colorScheme.background,
                alimentName: 'Lait',
                alimentWeight: '10cl',
              )
            ],
          ),
        ),

        const SizedBox(
          height: 12,
        ),

        /// Liste des aliments du déjeuner
        Container(
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Déjeuner',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  /// Button
                  Button(
                    onPressed: () async {
                      await Navigator.pushNamed(context, '/add_meal');
                    },
                    buttonText: 'Ajouter',
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 12,
        ),

        /// Liste des aliments du déjeuner
        Container(
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Diner',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  /// Button
                  Button(
                    onPressed: () async {
                      await Navigator.pushNamed(context, '/add_meal');
                    },
                    buttonText: 'Ajouter',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
