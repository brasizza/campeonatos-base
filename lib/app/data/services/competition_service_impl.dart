import 'export/competiton.dart';

class CompetitionServiceImpl implements CompetitionService {
  String baseUrl = "https://www.scorebat.com/api/competition/";

  @override
  Future<Map<Country, List<Competition>>?> getCompetitions() async {
    return await _repository!.getCompetitions(baseUrl);
  }

  static CompetitionServiceImpl? _instance;
  static CompetitionRepository? _repository;

  CompetitionServiceImpl._({required CompetitionRepository repository}) {
    Developer.logInstance(this);
  }

  factory CompetitionServiceImpl.instance({required CompetitionRepository repository}) {
    _repository = repository;
    _instance ??= CompetitionServiceImpl._(repository: repository);
    return _instance!;
  }
}
