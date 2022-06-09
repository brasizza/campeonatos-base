import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/data/models/team_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/services/championship_service_impl.dart';

class LeaguesController {
  late ChampionshipServiceImpl _service;

  LeaguesController() {
    log('Start the LeaguesController instance');
    _service = ChampionshipServiceImpl.instance;
  }

  Future<List<Team>?> getScore(String? link) async {
    return await _service.getScore(link);
  }
}
