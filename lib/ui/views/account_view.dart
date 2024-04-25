import 'package:compteur_cal/ui/widget/button.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String? selectedGender;

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Label
                  Text(
                    'Quel est ton sexe',
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
                            width: 1,
                            color: Theme.of(context).colorScheme.outline),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: selectedGender ?? 'Homme',
                      items: const [
                        DropdownMenuItem(value: 'Homme', child: Text('Homme')),
                        DropdownMenuItem(value: 'Femme', child: Text('Femme')),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value;
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

                  /// Label
                  Text(
                    'Quel est ton poids',
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
                            width: 1,
                            color: Theme.of(context).colorScheme.outline),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        labelText: 'test',
                      ),
                    ),
                  ),
                ],
              ),

              /// Espace
              const SizedBox(
                height: 24,
              )

              /// Choix du poids
              ///
            ],
          ),
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

        const SizedBox(
          height: 75,
        ),
      ],
    );
  }
}
