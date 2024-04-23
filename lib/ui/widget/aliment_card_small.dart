import 'package:compteur_cal/ui/widget/button.dart';
import 'package:flutter/material.dart';

class AlimentCardSmall extends StatefulWidget {
  final String alimentName;
  final Color colorBackground;
  final double calories;
  final VoidCallback onPressed;

  const AlimentCardSmall({
    super.key,
    required this.alimentName,
    required this.colorBackground,
    required this.calories,
    required this.onPressed,
  });

  @override
  State<AlimentCardSmall> createState() => _AlimentCardState();
}

class _AlimentCardState extends State<AlimentCardSmall> {
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
                Button(
                  onPressed: widget.onPressed,
                  buttonText: 'Détails',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
