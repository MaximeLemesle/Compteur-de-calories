import 'package:flutter/material.dart';
import 'package:countup/countup.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCircle extends StatelessWidget {
  final int titleText;
  final String subtitleText;
  final double percentage;

  const ProgressCircle(
      {super.key,
      required this.titleText,
      required this.subtitleText,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 20.0,
      percent: (percentage / 100) > 1 ? 1.0 : (percentage / 100),
      animation: true,
      animationDuration: 1000,
      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Countup(
            begin: 0,
            end: titleText.toDouble(),
            duration: const Duration(seconds: 1),
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
