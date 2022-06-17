import 'package:campeonatos/app/data/models/competition_model.dart';
import 'package:campeonatos/app/data/models/country_model.dart';

abstract class CompetitionService {
  Future<Map<Country, List<Competition>>?> getCompetitions();
}
