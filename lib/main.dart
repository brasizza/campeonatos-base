import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/competitions/competition_page.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/home/home_page.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/leagues/leagues_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    routes: {
      '/leagues': (context) => const LeaguesPage(),
      '/competitions': (context) => const CompetitionPage(),
    },
  ));
}
