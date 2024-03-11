import 'package:compteur_cal/ui/utils/nutriments_box.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CalorieView extends StatefulWidget {
  const CalorieView({super.key});

  @override
  State<CalorieView> createState() => _CalorieViewState();
}

class _CalorieViewState extends State<CalorieView> {
  /// Liste des macronutriments
  List<dynamic> nutriments = [
    // [ nutrimentsName, nutrimentsColor, nutrimentsProgress ]
    ["Calories", Colors.pink, 0.45],
    ["Protéines", Colors.blue, 0.25],
    ["Lipides", Colors.yellow, 0.2],
    ["Autres", Colors.purple, 0.1],
  ];

  /// Liste des repas
  List repas = [
    // [ nomRepas ]
    ["Petit Déjeuner"],
    ["Déjeuner"],
    ["Gouter"],
    ["Diner"],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Affichage date du jour
        Container(
          padding: const EdgeInsets.all(24),
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  'Ven. 23 Février',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),

        /// Affichage calories
        Container(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: CircularPercentIndicator(
              radius: 90.0,
              lineWidth: 16.0,
              percent: 0.6,
              animation: true,
              animationDuration: 1000,
              circularStrokeCap: CircularStrokeCap.round,
              center: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1240",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Total kcal",
                  ),
                ],
              ),
              progressColor: Colors.green,
            ),
          ),
        ),

        const SizedBox(
          height: 16,
        ),

        /// Affichage des macronutriments
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: nutriments.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              return NutrimentsBox(
                nutrimentsName: nutriments[index][0] as String,
                nutrimentsColor: nutriments[index][1] as Color,
                nutrimentsProgress: nutriments[index][2] as double,
              );
            },
          ),
        ),

        const SizedBox(
          height: 16,
        ),

        /// Affichage des repas
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue[100],
          ),
          child: ListView.builder(
            itemCount: repas.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Text(
                    repas[index][0],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
