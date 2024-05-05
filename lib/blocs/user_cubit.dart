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

  String get gender => state.gender;
  int get weight => state.weight;
  int get height => state.height;
  int get age => state.age;
  String get goal => state.goal;
}
