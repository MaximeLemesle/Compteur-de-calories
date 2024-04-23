import 'package:compteur_cal/models/aliment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Déclaration d'un "Cubit" pour stocker la liste des aliments
class AlimentCubit extends Cubit<List<Aliment>> {
  /// Constructeur + initialisation du Cubit avec un tableau vide d'aliments
  AlimentCubit() : super([]);

  /// Méthode pour charger la liste des aliments
  Future<void> loadAliments() async {
    emit([
      Aliment(id: 1, name: 'Banane'),
      Aliment(id: 2, name: 'Poire'),
      Aliment(id: 3, name: 'Kiwi'),
      Aliment(id: 4, name: 'Pomme'),
    ]);
  }

  /// Méthode pour ajouter un aliment
  void addCompany(Aliment aliment) {
    emit([...state, aliment]);
  }
}
