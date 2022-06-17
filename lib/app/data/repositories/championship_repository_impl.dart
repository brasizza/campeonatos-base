import '../../core/log/developer_log.dart';
import '../../core/rest/rest_client.dart';
import '../models/championship_model.dart';
import 'championship_repository.dart';

class ChampionshipRepositoryImpl implements ChampionshipRepository {
  late RestClient _restClient;

  @override
  Future<Championship?> getScore(String url) async {
    try {
      final response = await _restClient.get((url));
      if (response.statusCode != 200) {
        return Future.error('Falha ao recuperar os dados');
      }
      final responseJson = (response.data);
      if (responseJson['error'].length > 0) {
        return Future.error('Falha ao recuperar os dados');
      }
      if (responseJson['response'].length == 0) {
        return null;
      }

      if (responseJson['response']['hasStandings'] == 0) {
        return null;
      }
      // Championship? _championship;
      // _championship=  Championship.fromResponse(responseJson['response']);
      // final teams = responseJson['response']['standings']['rows'].map<Team>((competition) => Team.fromMap(competition)).toList();
      return Championship.fromResponse(responseJson['response']);
    } catch (error) {
      return Future.error('Falha ao recuperar os dados');
    }
  }

  static ChampionshipRepositoryImpl? _instance;
  ChampionshipRepositoryImpl._({required RestClient restClient}) {
    _restClient = restClient;
    Developer.logInstance(this);
  }
  factory ChampionshipRepositoryImpl.instance({required RestClient restClient}) {
    _instance ??= ChampionshipRepositoryImpl._(restClient: restClient);
    return _instance!;
  }
}
