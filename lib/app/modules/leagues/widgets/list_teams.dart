import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../../../data/models/team_model.dart';

class ListTeams extends StatelessWidget {
  final String urlLogos = 'https://s3.amazonaws.com/bookmkrs/img/logos/mini/';
  final List<Team> teams;
  const ListTeams(this.teams, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: teams.length,
        itemBuilder: ((context, index) {
          final team = teams[index];
          String? logo = (team.teamScId != null) ? "${team.teamScId}.png" : null;
          return Card(
              margin: const EdgeInsets.all(8),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '${team.team}${team.index.toString()}˚',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (logo == null)
                            ? Container()
                            : (index == 0)
                                ? Badge(
                                    shape: BadgeShape.circle,
                                    position: BadgePosition.topStart(start: 2, top: -10),
                                    badgeColor: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                    badgeContent: const Icon(
                                      Icons.sports_soccer,
                                      color: Colors.amberAccent,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Image.network(urlLogos + logo, errorBuilder: ((context, error, stackTrace) {
                                        return const SizedBox.shrink();
                                      })),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Image.network(urlLogos + logo, errorBuilder: ((context, error, stackTrace) {
                                      return const SizedBox.shrink();
                                    })),
                                  ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                const TextSpan(text: ' Total de pontos ', style: TextStyle(color: Colors.black)),
                                const TextSpan(text: '  '),
                                TextSpan(text: team.points.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ]),
                            ),

                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                const TextSpan(text: ' Jogos feitos ', style: TextStyle(color: Colors.black)),
                                const TextSpan(text: '  '),
                                TextSpan(text: team.matches.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ]),
                            ),

                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                const TextSpan(text: ' Vitórias ', style: TextStyle(color: Colors.black)),
                                const TextSpan(text: '  '),
                                TextSpan(text: team.wins.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ]),
                            ),

                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                const TextSpan(text: ' Derrotas ', style: TextStyle(color: Colors.black)),
                                const TextSpan(text: '  '),
                                TextSpan(text: team.loses.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ]),
                            ),

                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                const TextSpan(text: ' Empates ', style: TextStyle(color: Colors.black)),
                                const TextSpan(text: '  '),
                                TextSpan(text: team.draws.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ]),
                            ),
                            // Text('Posição na tabela '),
                            // Text('Jogos feitos'),
                            // Text('Vitórias'),
                            // Text('Emaptes'),
                            // Text('Derrotas'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ));
        }));
  }
}
