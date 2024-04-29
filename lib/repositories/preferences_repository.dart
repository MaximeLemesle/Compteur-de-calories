import 'dart:convert';
import 'package:compteur_cal/models/aliment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  Future<void> saveAliments(List<Aliment> aliments) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final Aliment aliment in aliments) {
      listJson.add(jsonEncode(aliment.toJson()));
    }
    prefs.setStringList('aliments', listJson);
  }

  Future<List<Aliment>> loadAliments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = prefs.getStringList('aliments') ?? [];
    return listJson.map((json) => Aliment.fromJson(jsonDecode(json))).toList();
  }
}
