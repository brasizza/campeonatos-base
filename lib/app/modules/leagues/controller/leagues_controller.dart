import '../../../core/log/developer_log.dart';
import '../../../data/models/championship_model.dart';
import '../../../data/models/competition_model.dart';
import '../../../data/services/championship_service.dart';

class LeaguesController {
  late ChampionshipService _service;

  static LeaguesController? _instance;

  Competition? _competition;
  set competition(Competition competition) => _competition = competition;

  LeaguesController._({required ChampionshipService service}) {
    _service = service;
    Developer.logInstance(this);
  }

  factory LeaguesController.instance({required ChampionshipService service}) {
    _instance ??= LeaguesController._(service: service);
    return _instance!;
  }

  Future<Championship?> getScore() async {
    return await _service.getScore(_competition?.link ?? '');
    // return championship;
  }
}
