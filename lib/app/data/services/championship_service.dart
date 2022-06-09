import 'package:tabela_brasileirao_serie_a/app/data/models/team_model.dart';

abstract class ChampionshipService {
  Future<List<Team>?> getScore(String? link);
}
