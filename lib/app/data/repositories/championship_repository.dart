import 'exports/championship.dart';

abstract class ChampionshipRepository {
  Future<Championship?> getScore(String url);
}
