import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/services/competition_service.dart';

import '../../data/services/competition_service_impl.dart';

class HomeController {
  late CompetitionServiceImpl competitionService;

  HomeController() {
    log('Start the HomeController instance');

    competitionService = CompetitionServiceImpl.instance;
  }

  Future<List<Competition>?> getCompetitions() async {
    return await competitionService.getCompetitions();
  }
}
