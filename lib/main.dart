import 'package:compteur_cal/blocs/aliment_cubit.dart';
import 'package:compteur_cal/ui/screens/add_aliment.dart';
import 'package:compteur_cal/ui/screens/home.dart';
import 'package:compteur_cal/ui/screens/meal_details.dart';
import 'package:compteur_cal/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
// Pour pouvoir utiliser les SharePreferences avant le runApp
  WidgetsFlutterBinding.ensureInitialized();
// Instanciation du Cubit
  final AlimentCubit companyCubit = AlimentCubit();
// Chargement des aliements
  companyCubit.loadAliments();
  runApp(BlocProvider<AlimentCubit>(
    create: (_) => companyCubit,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculateur de calories',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/home': (context) => const Home(),
        '/add_aliment': (context) => const AddAliment(),
        '/meal_details': (context) => const MealDetails(),
      },
      initialRoute: '/home',
    );
  }
}
