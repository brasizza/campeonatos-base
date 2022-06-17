import 'package:campeonatos/app/data/models/competition_model.dart';
import 'package:campeonatos/app/data/models/country_model.dart';
import 'package:campeonatos/app/modules/competitions/widgets/list_competition.dart';
import 'package:flutter/material.dart';

class CompetitionPage extends StatelessWidget {
  final List<Competition>? _competitions;
  final Country? _country;
  const CompetitionPage({Key? key, required List<Competition> competitions, required Country country})
      : _competitions = competitions,
        _country = country,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (_country?.flag == null) ? const SizedBox.shrink() : Image.network(_country!.flag!),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    _country?.name ?? '',
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListCompetition(_competitions!),
        ));
  }
}
