import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/core/rest/http/http_rest_client.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/error.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/loading.dart';
import 'package:tabela_brasileirao_serie_a/app/core/widgets/no_data.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/championship_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/repositories/championship_repository_impl.dart';
import 'package:tabela_brasileirao_serie_a/app/data/services/championship_service_impl.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/leagues/controller/leagues_controller.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/leagues/widgets/list_matches.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/leagues/widgets/list_teams.dart';

class LeaguesPage extends StatefulWidget {
  // final dynamic args;
  const LeaguesPage({Key? key}) : super(key: key);

  @override
  State<LeaguesPage> createState() => _LeaguesPageState();
}

final PageController _pageController = PageController(
  initialPage: 0,
  keepPage: false,
);

class _LeaguesPageState extends State<LeaguesPage> {
  int initialPage = 0;

  late Future<Championship?> futureScore;

  Competition? competition;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    competition = ModalRoute.of(context)?.settings.arguments as Competition;
    final LeaguesController controller = LeaguesController(
      service: ChampionshipServiceImpl.instance(
        repository: ChampionshipRepositoryImpl.instance(
          restClient: HttpRestClient.instance,
        ),
      ),
    );
    futureScore = controller.getScore(competition?.link);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (competition?.name == null) ? const SizedBox() : Text(competition!.name),
      ),
      body: FutureBuilder<Championship?>(
          future: futureScore,
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

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: (initialPage == 0) ? Colors.amber.shade700 : null),
                              onPressed: () {
                                _pageController.jumpToPage(0);
                                setState(() {
                                  initialPage = 0;
                                });
                              },
                              child: Text('Tabela')),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: (initialPage == 1) ? Colors.amber.shade700 : null),
                              onPressed: () {
                                _pageController.jumpToPage(1);

                                setState(() {
                                  initialPage = 1;
                                });
                              },
                              child: Text('Próximos')),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: (initialPage == 2) ? Colors.amber.shade700 : null),
                              onPressed: () {
                                _pageController.jumpToPage(2);
                                setState(() {
                                  initialPage = 2;
                                });
                              },
                              child: Text('Passados')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        children: [
                          ListTeams(snapshot.data!.teams),
                          ListMatches(snapshot.data!.futureMaches),
                          ListMatches(snapshot.data!.matches),
                        ],
                      ),
                    ),
                  ],
                );
            }
          }),
    );
  }
}
