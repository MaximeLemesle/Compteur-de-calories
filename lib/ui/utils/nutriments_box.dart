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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFBDBDBD)),
          borderRadius: BorderRadius.circular(8),
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    nutrimentsProgress.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: LinearPercentIndicator(
                lineHeight: 10.0,
                percent: nutrimentsProgress,
                backgroundColor: nutrimentsColor.withOpacity(0.1),
                progressColor: nutrimentsColor,
                animation: true,
                animationDuration: 1000,
                barRadius: const Radius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
