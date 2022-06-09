import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';

import '../../data/models/country_model.dart';
import '../../data/services/competition_service_impl.dart';

class HomeController {
  late CompetitionServiceImpl _service;

  HomeController() {
    log('Start the HomeController instance');

    _service = CompetitionServiceImpl.instance;
  }

  Future<Map<Country, List<Competition>>?> getCompetitions() async {
    return await _service.getCompetitions();
  }
}
