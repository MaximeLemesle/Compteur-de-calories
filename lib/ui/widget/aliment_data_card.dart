import 'package:compteur_cal/ui/theme/app_theme.dart';
import 'package:compteur_cal/ui/widget/macronutriments_informations.dart';
import 'package:flutter/material.dart';

class AlimentDataCard extends StatelessWidget {
  const AlimentDataCard(
      {super.key,
      required this.calories,
      required this.glucides,
      required this.proteins,
      required this.fats});
  final double calories;
  final double glucides;
  final double proteins;
  final double fats;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MacronutrimentsInformations(
                  macronutriments: 'Calories',
                  value: '${calories}kcal',
                  color: AppTheme.tealGreen,
                ),
                MacronutrimentsInformations(
                  macronutriments: 'Glucides',
                  value: '${glucides}g',
                  color: AppTheme.pinkRose,
                ),
                MacronutrimentsInformations(
                  macronutriments: 'Protéines',
                  value: '${proteins}g',
                  color: AppTheme.skyBlue,
                ),
                MacronutrimentsInformations(
                  macronutriments: 'Lipides',
                  value: '${fats}g',
                  color: AppTheme.mustardYellow,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
