import 'package:compteur_cal/blocs/user_cubit.dart';
import 'package:compteur_cal/ui/widget/button.dart';
import 'package:compteur_cal/ui/widget/info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  Map<String, dynamic> getUserInformation() {
    return <String, dynamic>{
      'gender': gender,
      'weight': weight,
      'height': height,
      'age': age,
      'goal': goal,
    };
  }

  /// User information
  String gender = 'Homme';
  double weight = 74.0;
  int height = 174;
  int age = 22;
  String goal = 'Perte de poids';

  /// Get user information
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// Change gender
    _genderController.text = gender;
    _genderController.addListener(() {
      setState(() {
        gender = _genderController.text;
      });
    });

    /// Change weight
    _weightController.text = weight.toString();
    _weightController.addListener(() {
      setState(() {
        weight = double.tryParse(_weightController.text) ?? weight;
      });
    });

    /// Change height
    _heightController.text = height.toString();
    _heightController.addListener(() {
      setState(() {
        height = int.tryParse(_heightController.text) ?? height;
      });
    });

    /// Change age
    _ageController.text = age.toString();
    _ageController.addListener(() {
      setState(() {
        age = int.tryParse(_ageController.text) ?? age;
      });
    });

    /// Change goal
    _goalController.text = goal;
    _goalController.addListener(() {
      setState(() {
        goal = _goalController.text;
      });
    });
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

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
            children: <Widget>[
              /// Choix du sexe
              InfoSection(
                inputLabel: "Quel est ton sexe",
                inputType: DropdownButton<String>(
                  value: gender,
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                        value: 'Homme', child: Text('Homme')),
                    DropdownMenuItem<String>(
                        value: 'Femme', child: Text('Femme')),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      gender = value!;
                      _genderController.text = value;
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
                  controller: _weightController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.speed_rounded,
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
                  controller: _heightController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.height_rounded,
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

              /// Choix de l'âge
              InfoSection(
                inputLabel: "Quel est ton âge",
                inputType: TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.cake_outlined,
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
                  value: goal,
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                        value: 'Perte de poids', child: Text('Perte de poids')),
                    DropdownMenuItem<String>(
                        value: 'Prise de masse', child: Text('Prise de masse')),
                    DropdownMenuItem<String>(
                        value: 'Maintient calorique',
                        child: Text('Maintient calorique')),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      goal = value!;
                      _goalController.text = value;
                    });
                  },
                  icon: Icon(
                    Icons.gps_not_fixed_sharp,
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
          children: <Widget>[
            Button(
              onPressed: () async {
                Map<String, dynamic> userInfo = getUserInformation();
                BlocProvider.of<UserCubit>(context)
                    .updateUserInformation(userInfo);
                print(userInfo);
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
