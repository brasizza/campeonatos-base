import 'package:tabela_brasileirao_serie_a/app/data/models/championship_model.dart';

abstract class ChampionshipService {
  Future<Championship?> getScore(String? link);
}
