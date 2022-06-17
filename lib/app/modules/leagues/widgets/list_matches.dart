import 'package:flutter/material.dart';
import '../../../core/utils.dart';
import '../../../data/models/game.dart';
import 'team_widget.dart';

class ListMatches extends StatelessWidget {
  final List<Game>? matches;
  const ListMatches(this.matches, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((matches?.length ?? 0) == 0) {
      return const Text('Sem jogos');
    }

    return ListView.builder(
        itemCount: matches?.length ?? 0,
        itemBuilder: ((context, index) {
          Game game = matches![index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(child: TeamWidget(game: game, team: 1)),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            game.placarTime1.toString(),
                          ),
                          const Text(
                            'X',
                          ),
                          Text(
                            game.placarTime2.toString(),
                          )
                        ],
                      ),
                      Text(
                        Utils.formatDate(game.dateGame.toIso8601String(), splitHour: true),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(child: TeamWidget(game: game, team: 2)),
                ],
              ),
            ),
          );
        }));
  }
}
