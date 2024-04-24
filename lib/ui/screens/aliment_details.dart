import 'package:compteur_cal/models/aliment.dart';
import 'package:compteur_cal/ui/widget/dropdown_custom.dart';
import 'package:flutter/material.dart';

class AlimentDetails extends StatefulWidget {
  const AlimentDetails({super.key});

  @override
  State<AlimentDetails> createState() => _AlimentDetailsState();
}

class _AlimentDetailsState extends State<AlimentDetails> {
  @override
  Widget build(BuildContext context) {
    final Aliment aliment =
        ModalRoute.of(context)!.settings.arguments as Aliment;

    return Scaffold(
      /// AppBar
      appBar: AppBar(
        title: Text(
          'Détails de l\'aliment',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            /// Nom de la l'aliment
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  aliment.name.capitalize(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                ),
              ),
            ),

            /// Espacement
            const SizedBox(
              height: 32,
            ),

            /// Choix du poids
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choisir le poids en grammes',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 16),

                  /// Input pour choisir le poids de l'aliment
                  const DropdownCustom(),

                  const SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
