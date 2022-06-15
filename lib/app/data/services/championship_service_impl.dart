import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/data/models/championship_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/services/championship_service.dart';
import '../repositories/championship_repository.dart';
import '../repositories/championship_repository_impl.dart';

class ChampionshipServiceImpl implements ChampionshipService {
  String baseUrl = 'https://www.scorebat.com/api/competition/2/';
  @override
  Future<Championship?> getScore(String? link) async {
    String url = baseUrl + (link ?? '');
    return await _repository!.getScore(url);
  }

  static ChampionshipServiceImpl? _instance;
  static ChampionshipRepository? _repository;

  ChampionshipServiceImpl._() {
    log('Start the ChampionshipServiceImpl instance');
  }
  factory ChampionshipServiceImpl.instance({required ChampionshipRepositoryImpl repository}) {
    _instance ??= ChampionshipServiceImpl._();
    return _instance!;
  }
}
