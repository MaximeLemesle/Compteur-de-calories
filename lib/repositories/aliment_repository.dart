import 'dart:convert';
import 'package:compteur_cal/models/aliment.dart';
import 'package:http/http.dart' as http;

class AlimentRepository {
  Future<List<Aliment>> fetchAliments(String query) async {
    const String apiKey = '3NTobbbWJqVKuJatB7NKWQ==eTdfGzImIR8lTYS2';
    final Uri url =
        Uri.parse('https://api.api-ninjas.com/v1/nutrition?query=$query');

    final response = await http.get(
      url,
      headers: {
        'X-Api-Key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List<Aliment> aliments = [];
      final List<dynamic> json = jsonDecode(response.body);

      for (Map<String, dynamic> result in json) {
        final Aliment aliment = Aliment(
          name: result['name'],
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