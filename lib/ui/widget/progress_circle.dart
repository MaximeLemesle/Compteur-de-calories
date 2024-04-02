import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCircle extends StatelessWidget {
  final String titleText;
  final String subtitleText;

  const ProgressCircle(
      {super.key, required this.titleText, required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 20.0,
      percent: 0.6,
      animation: true,
      animationDuration: 1000,
      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            subtitleText,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
      progressColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
    );
  }
}
