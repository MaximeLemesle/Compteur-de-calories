import 'package:compteur_cal/ui/theme/app_theme.dart';
import 'package:compteur_cal/ui/widget/macronutriments_informations.dart';
import 'package:flutter/material.dart';

class AlimentCard extends StatefulWidget {
  final String alimentName;
  final Color colorBackground;
  final double calories;
  final double glucides;
  final double proteins;
  final double fats;

  const AlimentCard({
    super.key,
    required this.alimentName,
    required this.colorBackground,
    required this.calories,
    required this.glucides,
    required this.proteins,
    required this.fats,
  });

  @override
  State<AlimentCard> createState() => _AlimentCardState();
}

class _AlimentCardState extends State<AlimentCard> {
  bool isMacroVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: ShapeDecoration(
        color: widget.colorBackground,
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
                      '${widget.calories}kcal',
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
                              macronutriments: 'Calories',
                              value: '${widget.calories}kcal',
                              color: AppTheme.tealGreen,
                            ),
                            MacronutrimentsInformations(
                              macronutriments: 'Glucides',
                              value: '${widget.glucides}g',
                              color: AppTheme.pinkRose,
                            ),
                            MacronutrimentsInformations(
                              macronutriments: 'Protéines',
                              value: '${widget.proteins}g',
                              color: AppTheme.skyBlue,
                            ),
                            MacronutrimentsInformations(
                              macronutriments: 'Lipides',
                              value: '${widget.fats}g',
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
