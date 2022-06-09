import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/error.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/loading.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/no_data.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/team_model.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/leagues/leagues_controller.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/leagues/widgets/list_teams.dart';

class LeaguesPage extends StatefulWidget {
  // final dynamic args;
  const LeaguesPage({Key? key}) : super(key: key);

  @override
  State<LeaguesPage> createState() => _LeaguesPageState();
}

class _LeaguesPageState extends State<LeaguesPage> {
  final LeaguesController controller = LeaguesController();
  @override
  Widget build(BuildContext context) {
    final Competition? competition = ModalRoute.of(context)?.settings.arguments as Competition;
    return Scaffold(
      appBar: AppBar(
        title: (competition?.name == null) ? SizedBox() : Text(competition!.name),
      ),
      body: FutureBuilder<List<Team>?>(
          future: controller.getScore(competition?.link),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const LoadingWidgetCustom(text: 'Carregando os times');
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return ErrorWidgetCustom(text: snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return const NoDataWidgetCustom(text: 'Nenhuma competição encontrada');
                }
                return ListTeams(snapshot.data!);
            }
          }),
    );
  }
}
