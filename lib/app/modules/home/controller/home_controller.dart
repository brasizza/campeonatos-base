import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/services/competition_service.dart';

import '../../../data/models/country_model.dart';

class HomeController {
  late CompetitionService _service;

  HomeController({required CompetitionService service}) {
    _service = service;
    log('Start the HomeController instance');
  }

  Future<Map<Country, List<Competition>>?> getCompetitions() async {
    return await _service.getCompetitions();
  }
}
