import 'package:flutter/material.dart';

import '../../../data/models/game.dart';

class TeamWidget extends StatelessWidget {
  final Game game;
  final int team;

  const TeamWidget({Key? key, required this.game, required this.team}) : super(key: key);

  final String urlLogos = 'https://s3.amazonaws.com/bookmkrs/img/logos/mini/';

  @override
  Widget build(BuildContext context) {
    String logo = (team == 1) ? "${game.idTime1}.png" : "${game.idTime2}.png";
    return Column(children: [
      Text(
        (team == 1) ? game.time1 : game.time2,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Image.network(urlLogos + logo, errorBuilder: ((context, error, stackTrace) {
          return const SizedBox.shrink();
        })),
      )
    ]);
  }
}
