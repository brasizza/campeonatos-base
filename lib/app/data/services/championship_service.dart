import 'export/championship.dart';

abstract class ChampionshipService {
  Future<Championship?> getScore(String? link);
}
