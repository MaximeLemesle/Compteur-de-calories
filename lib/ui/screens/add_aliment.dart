import 'package:compteur_cal/models/aliment.dart';
import 'package:compteur_cal/repositories/aliment_repository.dart';
import 'package:compteur_cal/ui/theme/app_theme.dart';
import 'package:compteur_cal/ui/widget/aliment_card_small.dart';
import 'package:compteur_cal/ui/widget/search_text_field.dart';
import 'package:flutter/material.dart';

class AddAliment extends StatefulWidget {
  const AddAliment({super.key});

  @override
  State<AddAliment> createState() => _AddAlimentState();
}

class _AddAlimentState extends State<AddAliment> {
  static List<Aliment> _aliments = [];
  bool _showResults = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: AppBar(
        title: Text(
          'Ajouter un aliment',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            /// Recherche des aliments
            SearchTextField(
              labelText: 'Rechercher un aliment',
              onChanged: (value) async {
                final result = await AlimentRepository().fetchAliments(value);
                setState(() {
                  _aliments = result;
                  _showResults = _aliments.isNotEmpty || value.isNotEmpty;
                });
              },
            ),

            const SizedBox(
              height: 16,
            ),

            /// Affichage du fond de recherche
            Column(
              children: _showResults
                  ? []
                  : [
                      const Image(
                        image: AssetImage('assets/img/arrow-1.png'),
                        height: 100,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: SizedBox(
                          height: 100,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Taper votre ',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                const TextSpan(
                                  text: 'recherche',
                                  style: TextStyle(
                                    color: AppTheme.tealGreen,
                                    fontSize: 22,
                                    fontFamily: 'Dela Gothic One',
                                    letterSpacing: 0.44,
                                  ),
                                ),
                                TextSpan(
                                  text: ' pour ',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                const TextSpan(
                                  text: 'trouver',
                                  style: TextStyle(
                                    color: AppTheme.mustardYellow,
                                    fontSize: 22,
                                    fontFamily: 'Dela Gothic One',
                                    letterSpacing: 0.44,
                                  ),
                                ),
                                TextSpan(
                                  text: ' des ',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                const TextSpan(
                                  text: 'aliments',
                                  style: TextStyle(
                                    color: AppTheme.blueViolet,
                                    fontSize: 22,
                                    fontFamily: 'Dela Gothic One',
                                    letterSpacing: 0.44,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
            ),

            /// Affichage des résultat de l'API
            Expanded(
              child: ListView.separated(
                itemCount: _aliments.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AlimentCardSmall(
                      colorBackground:
                          Theme.of(context).colorScheme.surfaceVariant,
                      alimentName: _aliments[index].name.capitalize(),
                      calories: _aliments[index].calories,
                      onPressed: () async {
                        await Navigator.pushNamed(
                          context,
                          '/aliment_details',
                          arguments: _aliments[index],
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Vider les résultats de l'API en quittant la page
  @override
  void dispose() {
    _aliments.clear();
    super.dispose();
  }
}

/// Ajout d'une majuscule au début d'une chaine de caractère
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
