import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/data/models/championship_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/services/championship_service.dart';

class LeaguesController {
  late ChampionshipService _service;

  LeaguesController({required ChampionshipService service}) {
    _service = service;
    log('Start the LeaguesController instance');
  }

  Future<Championship?> getScore(String? link) async {
    return await _service.getScore(link);
  }
}
