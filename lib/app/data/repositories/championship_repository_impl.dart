import 'dart:convert';
import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/data/models/championship_model.dart';

import './championship_repository.dart';

import 'package:http/http.dart' as http;

class ChampionshipRepositoryImpl implements ChampionshipRepository {
  @override
  Future<Championship?> getScore(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {}
      final responseJson = json.decode(response.body);
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
  ChampionshipRepositoryImpl._() {
    log('Start the ChampionshipRepositoryImpl instance');
  }
  static ChampionshipRepositoryImpl get instance {
    _instance ??= ChampionshipRepositoryImpl._();
    return _instance!;
  }
}
