import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/repositories/competition_repository_impl.dart';
import '../models/country_model.dart';
import './competition_service.dart';

class CompetitionServiceImpl implements CompetitionService {
  String baseUrl = "https://www.scorebat.com/api/competition/";

  @override
  Future<Map<Country, List<Competition>>?> getCompetitions() async {
    return await _repository!.getCompetitions(baseUrl);
  }

  static CompetitionServiceImpl? _instance;
  static CompetitionRepositoryImpl? _repository;

  CompetitionServiceImpl._() {
    _repository ??= CompetitionRepositoryImpl.instance;
    log('Start the CompetitionServiceImpl instance');
  }

  static CompetitionServiceImpl get instance {
    _instance ??= CompetitionServiceImpl._();
    return _instance!;
  }
}
