import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/no_data.dart';
import '../../../data/models/game.dart';
import 'team_widget.dart';

class ListMatches extends StatelessWidget {
  final List<Game>? matches;
  const ListMatches(this.matches, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((matches?.length ?? 0) == 0) {
      return const NoDataWidgetCustom(
        text: 'Sem jogos',
      );
    }

    return ListView.builder(
        itemCount: matches?.length ?? 0,
        itemBuilder: ((context, index) {
          Game game = matches![index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: SizedBox(child: TeamWidget(game: game, team: 1))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                  Expanded(child: SizedBox(child: TeamWidget(game: game, team: 2))),
                ],
              ),
            ),
          );
        }));
  }
}
