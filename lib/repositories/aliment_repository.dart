import 'dart:convert';
import 'package:compteur_cal/models/aliment.dart';
import 'package:http/http.dart';

class AlimentRepository {
  // static const String apiKey = 'a798d2cb4ee14472a43a0c8a05f88c26';
  static const String apiKey = '4833a0b541654e488090a0ec4a354926';

  /// Appel des ingredients correspondants à une recherche
  Future<List<Aliment>> fetchAliments(String query) async {
    final Response response = await get(
      Uri.parse(
        'https://api.spoonacular.com/food/ingredients/search?query=$query&apiKey=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final List<Aliment> aliments = [];
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> results = json['results'];

      for (Map<String, dynamic> result in results) {
        final Aliment aliment = Aliment(
          id: result['id'],
          name: result['name'],
          quantity: 0,
          calories: 0, 
          glucides: 0, 
          proteins: 0, 
          fats: 0,
        );

        // Récuperer les détails de l'aliment
        final Aliment alimentData = await fetchAlimentData(aliment.id);

        aliments.add(alimentData);
      }
      
      return aliments;
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  /// Appel des informations pour un ingredient
  Future<Aliment> fetchAlimentData(int id) async {
    final Response response = await get(
      Uri.parse(
        'https://api.spoonacular.com/food/ingredients/$id/information?amount=100&unit=grams&apiKey=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      final List<dynamic> nutrients = json['nutrition']['nutrients'];

      final protein =
          nutrients.firstWhere((nutrient) => nutrient['name'] == 'Protein');
      final fat = nutrients.firstWhere((nutrient) => nutrient['name'] == 'Fat');
      final carbohydrates = nutrients
          .firstWhere((nutrient) => nutrient['name'] == 'Carbohydrates');
      final calories =
          nutrients.firstWhere((nutrient) => nutrient['name'] == 'Calories');

      final Aliment aliment = Aliment(
        id: json['id'],
        name: json['name'],
        quantity: json['amount'],
        calories: calories['amount'].toDouble(),
        glucides: carbohydrates['amount'].toDouble(),
        proteins: protein['amount'].toDouble(),
        fats: fat['amount'].toDouble(),
      );

      return aliment;
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }
}

// Ninja API Nutrition - API Key: 3NTobbbWJqVKuJatB7NKWQ==eTdfGzImIR8lTYS2
// Spoonacular - API Key: a798d2cb4ee14472a43a0c8a05f88c26