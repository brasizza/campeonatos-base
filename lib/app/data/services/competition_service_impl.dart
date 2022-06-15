import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/repositories/competition_repository.dart';
import '../models/country_model.dart';
import './competition_service.dart';

class CompetitionServiceImpl implements CompetitionService {
  String baseUrl = "https://www.scorebat.com/api/competition/";

  @override
  Future<Map<Country, List<Competition>>?> getCompetitions() async {
    return await _repository!.getCompetitions(baseUrl);
  }

  static CompetitionServiceImpl? _instance;
  static CompetitionRepository? _repository;

  CompetitionServiceImpl._({required CompetitionRepository repository}) {
    log('Start the CompetitionServiceImpl instance');
  }

  factory CompetitionServiceImpl.instance({required CompetitionRepository repository}) {
    _repository = repository;
    _instance ??= CompetitionServiceImpl._(repository: repository);
    return _instance!;
  }
}
