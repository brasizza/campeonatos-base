import '../models/championship_model.dart';

abstract class ChampionshipService {
  Future<Championship?> getScore(String? link);
}
