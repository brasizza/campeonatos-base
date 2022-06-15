import 'dart:convert';
import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/core/rest/rest_client.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/country_model.dart';

import './competition_repository.dart';
import 'package:http/http.dart' as http;

class CompetitionRepositoryImpl implements CompetitionRepository {
  late RestClient _restClient;

  @override
  Future<Map<Country, List<Competition>>?> getCompetitions(String url) async {
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
      Map<Country, List<Competition>> competicoes = {};
      for (var competition in responseJson['response']) {
        if (competition['hasStandings'] >= 1) {
          // if(_competitions)
          final country = Country.fromMap(competition['country']);
          if (!competicoes.containsKey(country)) {
            competicoes[country] = [];
          }
          competicoes[country]?.add(Competition.fromMap(competition));
        }
      }
      return competicoes;
    } catch (error) {
      return Future.error('Falha ao recuperar os dados');
    }
  }

  static CompetitionRepositoryImpl? _instance;
  CompetitionRepositoryImpl._({required RestClient restClient}) {
    _restClient = restClient;
    log('Start the CompetitionRepositoryImpl instance');
  }
  factory CompetitionRepositoryImpl.instance({required RestClient restClient}) {
    _instance ??= CompetitionRepositoryImpl._(restClient: restClient);
    return _instance!;
  }
}
