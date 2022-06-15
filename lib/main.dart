import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/competitions/competition_page.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/home/home_page.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/leagues/leagues_page.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/splash/splash_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashPage(),
      '/leagues': (context) => const LeaguesPage(),
      '/home': (context) => const HomePage(),
      '/competitions': (context) => const CompetitionPage(),
    },
    onGenerateRoute: (settings) {
      print(settings);
    },
  ));
}
