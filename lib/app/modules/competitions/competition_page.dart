import 'package:flutter/material.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/country_model.dart';
import 'package:tabela_brasileirao_serie_a/app/modules/competitions/widgets/list_competition.dart';

class CompetitionPage extends StatelessWidget {
  const CompetitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final competition = ModalRoute.of(context)?.settings.arguments as Map;
    List<Competition>? competitions = competition['competitions'];
    Country country = competition['country'];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (country.flag == null) ? const SizedBox.shrink() : Image.network(country.flag!),
              Text(country.name),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListCompetition(competitions!),
        ));
  }
}
