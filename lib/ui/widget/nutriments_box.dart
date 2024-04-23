import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class NutrimentsBox extends StatelessWidget {
  final String nutrimentsName;
  final Color nutrimentsColor;
  final double nutrimentsProgress;

  const NutrimentsBox({
    super.key,
    required this.nutrimentsName,
    required this.nutrimentsColor,
    required this.nutrimentsProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nutrimentsName,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: (124 * nutrimentsProgress).toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: '/124',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: LinearPercentIndicator(
              lineHeight: 10.0,
              percent: nutrimentsProgress,
              backgroundColor: nutrimentsColor.withOpacity(0.2),
              progressColor: nutrimentsColor,
              animation: true,
              animationDuration: 1000,
              barRadius: const Radius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
