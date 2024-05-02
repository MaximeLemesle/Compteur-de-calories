import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final String inputLabel;
  final Widget inputType;

  const InfoSection({
    super.key, 
    required this.inputLabel, 
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        const SizedBox(
          height: 12,
        ),

        /// Select
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: inputType),
      ],
    );
  }
}
