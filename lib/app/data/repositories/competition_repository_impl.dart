import 'dart:convert';
import 'dart:developer';

import 'package:tabela_brasileirao_serie_a/app/core/exceptions/competition_not_found.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/competition_model.dart';

import './competition_repository.dart';
import 'package:http/http.dart' as http;

class CompetitionRepositoryImpl implements CompetitionRepository {
  @override
  Future<List<Competition>?> getCompetitions(String url) async {
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
      final competitions = responseJson['response'].map<Competition>((competition) => Competition.fromMap(competition)).toList();
      return competitions;
    } catch (error) {
      return Future.error('Falha ao recuperar os dados');
    }
  }

  static CompetitionRepositoryImpl? _instance;
  CompetitionRepositoryImpl._() {
    log('Start the CompetitionRepositoryImpl instance');
  }
  static CompetitionRepositoryImpl get instance {
    _instance ??= CompetitionRepositoryImpl._();
    return _instance!;
  }
}
