import 'package:compteur_cal/models/aliment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Déclaration d'un "Cubit" pour stocker la liste des aliments
class AlimentCubit extends Cubit<List<Aliment>> {
  /// Constructeur + initialisation du Cubit avec un tableau vide d'aliments
  AlimentCubit() : super([]);

  /// Méthode pour charger la liste des aliments
  Future<void> loadAliments() async {
    emit([
      // Aliment(
      //     id: 1,
      //     name: 'Banane',
      //     quantity: 1,
      //     calories: 512,
      //     glucides: 30,
      //     proteins: 20,
      //     fats: 10),
      // Aliment(
      //     id: 2,
      //     name: 'Poire',
      //     quantity: 1,
      //     calories: 130,
      //     glucides: 30,
      //     proteins: 20,
      //     fats: 10),
      // Aliment(
      //     id: 3,
      //     name: 'Kiwi',
      //     quantity: 1,
      //     calories: 290,
      //     glucides: 30,
      //     proteins: 20,
      //     fats: 10),
    ]);
  }

  /// Méthode pour ajouter un aliment
  void addAliment(Aliment aliment) {
    emit([...state, aliment]);
  }
}
