import '../models/competition_model.dart';
import 'competition_service_impl.dart';

abstract class CompetitionService {
  Future<List<Competition>?> getCompetitions();
}
