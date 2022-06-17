import 'package:campeonatos/app/data/models/championship_model.dart';

abstract class ChampionshipRepository {
  Future<Championship?> getScore(String url);
}
