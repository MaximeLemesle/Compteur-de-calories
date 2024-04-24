import 'dart:async';

import 'package:compteur_cal/ui/screens/home.dart';
import 'package:compteur_cal/ui/theme/app_theme.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _showCheckIcon = false;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Timer(const Duration(milliseconds: 1200), () {
      setState(() {
        _showCheckIcon = true;
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: const Home(),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [
          //   Theme.of(context).colorScheme.primary,
          //   Theme.of(context).colorScheme.tertiary
          // ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        child: Center(
          child: CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 20.0,
            percent: 1.0, // Utiliser la valeur de pourcentage
            animation: true,
            animationDuration: 1000,
            circularStrokeCap: CircularStrokeCap.round,
            center: _buildAnimatedIcon(),
            progressColor: Theme.of(context).colorScheme.tertiary,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon() {
    return AnimatedOpacity(
      opacity: _showCheckIcon
          ? 1.0
          : 0.0, // Définir l'opacité en fonction de _showCheckIcon
      duration: const Duration(milliseconds: 500), // Durée de l'animation
      child: Icon(
        Icons.check,
        size: 50.0,
        color: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }
}
