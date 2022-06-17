import 'package:flutter/material.dart';
import '../../core/widgets/error.dart';
import '../../core/widgets/loading.dart';
import '../../core/widgets/no_data.dart';
import '../../data/models/championship_model.dart';
import '../../data/models/competition_model.dart';
import 'controller/leagues_controller.dart';
import 'widgets/list_matches.dart';
import 'widgets/list_teams.dart';

class LeaguesPage extends StatefulWidget {
  final LeaguesController controller;
  const LeaguesPage({Key? key, required this.controller}) : super(key: key);

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

    futureScore = widget.controller.getScore();
  }

  @override
  void didChangeDependencies() {
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
                              child: const Text('Tabela')),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: (initialPage == 1) ? Colors.amber.shade700 : null),
                              onPressed: () {
                                _pageController.jumpToPage(1);

                                setState(() {
                                  initialPage = 1;
                                });
                              },
                              child: const Text('Próximos')),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: (initialPage == 2) ? Colors.amber.shade700 : null),
                              onPressed: () {
                                _pageController.jumpToPage(2);
                                setState(() {
                                  initialPage = 2;
                                });
                              },
                              child: const Text('Passados')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
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
