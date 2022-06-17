import '../models/competition_model.dart';
import '../models/country_model.dart';

abstract class CompetitionRepository {
  Future<Map<Country, List<Competition>>?> getCompetitions(String url);
}
