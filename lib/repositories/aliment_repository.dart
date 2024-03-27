import 'dart:convert';
import 'package:compteur_cal/models/aliment.dart';
import 'package:http/http.dart';

class AlimentRepository {
  Future<List<Aliment>> fetchAliments(String query) async {
    const String apiKey = 'a798d2cb4ee14472a43a0c8a05f88c26';
    final Response response = await get(Uri.parse(
        'https://api.spoonacular.com/food/ingredients/search?query=$query&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final List<Aliment> aliments = [];
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> results = json['results'];
      
      for (Map<String, dynamic> result in results) {
        final Aliment aliment = Aliment(
          id: result['id'],
          name: result['name'],
          image: result['image'],
        );
        aliments.add(aliment);
      }

      return aliments;
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }
}


// Ninja API Nutrition - API Key: 3NTobbbWJqVKuJatB7NKWQ==eTdfGzImIR8lTYS2
// Spoonacular - API Key: a798d2cb4ee14472a43a0c8a05f88c26