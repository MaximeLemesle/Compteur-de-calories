import 'package:compteur_cal/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<User> {
  /// Valeur par défaut
  UserCubit()
      : super(
          User(
            gender: 'Homme',
            weight: 74,
            height: 174,
            age: 22,
            goal: 'Perte de poids',
          ),
        );

  /// Actualiser les infos
  void updateUser({
    required String gender,
    required int weight,
    required int height,
    required int age,
    required String goal,
  }) {
    emit(User(
      gender: gender,
      weight: weight,
      height: height,
      age: age,
      goal: goal,
    ));
  }

  /// Calcul calories
  double calculateCaloriesNeeds() {
    final user = state;
    double baseCal;
    if (user.gender.toLowerCase() == 'homme') {
      baseCal = 10 * user.weight + 6.25 * user.height - 5 * user.age + 5;
    } else {
      baseCal = 10 * user.weight + 6.25 * user.height - 5 * user.age - 161;
    }

    /// Ajouter ou enlever des calories selon l'objectif
    if (user.goal.toLowerCase() == 'prise de masse') {
      baseCal += 200;
    } else if (user.goal.toLowerCase() == 'perte de poids') {
      baseCal -= 200;
    }

    return baseCal;
  }


  /// Getters pour acceder aux données de l'utilisateur
  double get caloriesNeeds => calculateCaloriesNeeds();
  String get gender => state.gender;
  int get weight => state.weight;
  int get height => state.height;
  int get age => state.age;
  String get goal => state.goal;
}
