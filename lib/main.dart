import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/home/home_page.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/leagues/leagues_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    routes: {'/leagues': (context) => LeaguesPage()},

    // onGenerateRoute: (settings) {
    //   // If you push the PassArguments route
    //   if (settings.name == '/leagues') {
    //     // Cast the arguments to the correct
    //     // type: ScreenArguments.
    //     final args = settings.arguments;

    //     // Then, extract the required data from
    //     // the arguments and pass the data to the
    //     // correct screen.
    //     return MaterialPageRoute(
    //       builder: (context) {
    //         return LeaguesPage(args: args);
    //       },
    //     );
    //   }
    //   assert(false, 'Need to implement ${settings.name}');
    //   return null;
    //  })
  ));
}
