import 'package:compteur_cal/models/aliment.dart';
import 'package:compteur_cal/repositories/preferences_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Déclaration d'un "Cubit" pour stocker la liste des aliments
class AlimentCubit extends Cubit<List<Aliment>> {
  final PreferencesRepository preferencesRepository;

  /// Constructeur + initialisation du Cubit avec un tableau vide d'aliments
  AlimentCubit(this.preferencesRepository) : super(<Aliment>[]);

  /// Méthode pour charger la liste des aliments
  Future<void> loadAliments() async {
    final List<Aliment>aliments = await preferencesRepository.loadAliments();
    emit(aliments);
  }

  /// Méthode pour ajouter un aliment
  void addAliment(Aliment aliment) {
    emit(<Aliment>[...state, aliment]);
    preferencesRepository.saveAliments(state);
  }
}
