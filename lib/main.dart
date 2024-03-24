import 'package:compteur_cal/ui/screens/add_meal.dart';
import 'package:compteur_cal/ui/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculateur de calories',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => const Home(),
        '/add_meal': (context) => const AddMeal(),
      },
      initialRoute: '/home',
    );
  }
}
