import 'exports/competiton.dart';

abstract class CompetitionRepository {
  Future<Map<Country, List<Competition>>?> getCompetitions(String url);
}
