import 'export/competiton.dart';

abstract class CompetitionService {
  Future<Map<Country, List<Competition>>?> getCompetitions();
}
