import 'package:compteur_cal/ui/widget/button.dart';
import 'package:compteur_cal/ui/widget/info_section.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String selectedGender = 'Homme';
  String selectedGoal = 'Perte de poids';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /// Nom de la page
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
              'Mon compte',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              /// Choix du sexe
              InfoSection(
                inputLabel: "Quel est ton sexe",
                inputType: DropdownButton<String>(
                  value: selectedGender,
                  items: const [
                    DropdownMenuItem(value: 'Homme', child: Text('Homme')),
                    DropdownMenuItem(value: 'Femme', child: Text('Femme')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                  icon: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  isExpanded: true,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant),
                  underline: Container(),
                ),
              ),

              /// Séparateur
              const SizedBox(
                height: 24,
              ),

              /// Choix du poids
              InfoSection(
                inputLabel: "Quel est ton poids",
                inputType: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Poids en kg',
                    labelStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Change the labelText color to red
                    ),
                  ),
                ),
              ),

              /// Séparateur
              const SizedBox(
                height: 24,
              ),

              /// Choix de la taille
              InfoSection(
                inputLabel: "Quel est ta taille",
                inputType: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Taille en cm',
                    labelStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Change the labelText color to red
                    ),
                  ),
                ),
              ),

              /// Séparateur
              const SizedBox(
                height: 24,
              ),

              /// Choix du poids
              InfoSection(
                inputLabel: "Quel est ton âge",
                inputType: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Âge en année',
                    labelStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Change the labelText color to red
                    ),
                  ),
                ),
              ),

              /// Séparateur
              const SizedBox(
                height: 24,
              ),

              /// Choix de l'objectif
              InfoSection(
                inputLabel: "Quel est ton objectif",
                inputType: DropdownButton<String>(
                  value: selectedGoal,
                  items: const [
                    DropdownMenuItem(
                        value: 'Perte de poids', child: Text('Perte de poids')),
                    DropdownMenuItem(
                        value: 'Prise de masse', child: Text('Prise de masse')),
                    DropdownMenuItem(
                        value: 'Maintient calorique',
                        child: Text('Maintient calorique')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedGoal = value!;
                    });
                  },
                  icon: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  isExpanded: true,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant),
                  underline: Container(),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 50,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              onPressed: () async {
                await Navigator.pushNamed(context, '/home');
              },
              buttonText: "Valider mes informations",
              showIcon: false,
              isTitle: true,
            ),
          ],
        ),
      ],
    );
  }
}
