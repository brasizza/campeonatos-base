import 'package:campeonatos/app/core/log/developer_log.dart';
import 'package:campeonatos/app/data/models/championship_model.dart';
import 'package:campeonatos/app/data/repositories/championship_repository.dart';
import 'package:campeonatos/app/data/services/championship_service.dart';

class ChampionshipServiceImpl implements ChampionshipService {
  String baseUrl = 'https://www.scorebat.com/api/competition/2/';
  @override
  Future<Championship?> getScore(String? link) async {
    String url = baseUrl + (link ?? '');
    return await _repository!.getScore(url);
  }

  static ChampionshipServiceImpl? _instance;
  static ChampionshipRepository? _repository;

  ChampionshipServiceImpl._({required ChampionshipRepository repository}) {
    _repository = repository;
    Developer.logInstance(this);
  }
  factory ChampionshipServiceImpl.instance({required ChampionshipRepository repository}) {
    _instance ??= ChampionshipServiceImpl._(repository: repository);
    return _instance!;
  }
}
