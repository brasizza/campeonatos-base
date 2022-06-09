import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';

abstract class CompetitionRepository {
  Future<List<Competition>?> getCompetitions(String url);
}
