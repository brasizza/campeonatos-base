import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/core/utils.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/game.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/leagues/widgets/team_widget.dart';

class ListMatches extends StatelessWidget {
  final List<Game>? matches;
  const ListMatches(this.matches, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((this.matches?.length ?? 0) == 0) {
      return Text('Sem jogos');
    }

    return ListView.builder(
        itemCount: matches?.length ?? 0,
        itemBuilder: ((context, index) {
          Game _game = matches![index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(child: TeamWidget(game: _game, team: 1)),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            _game.placarTime1.toString(),
                          ),
                          Text(
                            'X',
                          ),
                          Text(
                            _game.placarTime1.toString(),
                          )
                        ],
                      ),
                      Text(
                        Utils.formatDate(_game.dateGame.toIso8601String(), splitHour: true),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(child: TeamWidget(game: _game, team: 2)),
                ],
              ),
            ),
          );
        }));
  }
}
