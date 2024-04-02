import 'package:compteur_cal/ui/theme/app_theme.dart';
import 'package:compteur_cal/ui/widget/macronutriments_informations.dart';
import 'package:flutter/material.dart';

class AlimentCard extends StatefulWidget {
  final String alimentName;
  final String alimentWeight;

  const AlimentCard({
    super.key,
    required this.alimentName,
    required this.alimentWeight,
  });

  @override
  State<AlimentCard> createState() => _AlimentCardState();
}

class _AlimentCardState extends State<AlimentCard> {
  bool isMacroVisible = false;
  final List<String> macronutrimentsName = [
    'Calories',
    'Glucides',
    'Protéines',
    'Lipides',
  ];
  final List<String> macronutrimentsWeight = [
    '230,7kcal',
    '23g',
    '12g',
    '8g',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.alimentName,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.alimentWeight,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMacroVisible = !isMacroVisible;
                    });
                  },
                  child: Icon(
                    isMacroVisible
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: isMacroVisible
                ? Column(
                    children: [
                      const SizedBox(height: 12),

                      /// Séparateur
                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),

                      const SizedBox(height: 12),

                      /// Récap des macrobutriments de l'aliment
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MacronutrimentsInformations(
                              macronutriments: macronutrimentsName[0],
                              value: macronutrimentsWeight[0],
                              color: AppTheme.tealGreen,
                            ),
                            MacronutrimentsInformations(
                              macronutriments: macronutrimentsName[1],
                              value: macronutrimentsWeight[1],
                              color: AppTheme.pinkRose,
                            ),
                            MacronutrimentsInformations(
                              macronutriments: macronutrimentsName[2],
                              value: macronutrimentsWeight[2],
                              color: AppTheme.skyBlue,
                            ),
                            MacronutrimentsInformations(
                              macronutriments: macronutrimentsName[3],
                              value: macronutrimentsWeight[3],
                              color: AppTheme.mustardYellow,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : null,
          )
        ],
      ),
    );
  }
}
