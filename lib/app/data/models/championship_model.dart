// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tabela_brasileirao_serie_a/app/data/models/game.dart';
import 'package:tabela_brasileirao_serie_a/app/data/models/team_model.dart';

class Championship {
  final List<Team> teams;

  final List<Game>? matches;

  final List<Game>? futureMaches;
  Championship({
    required this.teams,
    required this.matches,
    required this.futureMaches,
  });

  Championship copyWith({
    List<Team>? teams,
    List<Game>? matches,
    List<Game>? futureMaches,
  }) {
    return Championship(
      teams: teams ?? this.teams,
      matches: matches ?? this.matches,
      futureMaches: futureMaches ?? this.futureMaches,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'teams': teams.map((x) => x.toMap()).toList(),
      'matches': (matches == null) ? null : matches!.map((x) => x.toMap()).toList(),
      'futureMaches': (futureMaches == null) ? null : futureMaches!.map((x) => x.toMap()).toList(),
    };
  }

  factory Championship.fromMap(Map<String, dynamic> map) {
    return Championship(
      teams: List<Team>.from(
        (map['teams'] as List<int>).map<Team>(
          (x) => Team.fromMap(x as Map<String, dynamic>),
        ),
      ),
      matches: List<Game>.from(
        (map['matches'] as List<int>).map<Game>(
          (x) => Game.fromMap(x as Map<String, dynamic>),
        ),
      ),
      futureMaches: List<Game>.from(
        (map['futureMaches'] as List<int>).map<Game>(
          (x) => Game.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Championship.fromJson(String source) => Championship.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Championship(teams: $teams, matches: $matches, futureMaches: $futureMaches)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Championship && listEquals(other.teams, teams) && listEquals(other.matches, matches) && listEquals(other.futureMaches, futureMaches);
  }

  @override
  int get hashCode => teams.hashCode ^ matches.hashCode ^ futureMaches.hashCode;

  factory Championship.fromResponse(responseJson) {
    final _championship = Championship(
      teams: responseJson['standings']['rows'].map<Team>((team) => Team.fromMap(team)).toList(),
      matches: responseJson['results'].map<Game>((team) => Game.fromMap(team)).toList(),
      futureMaches: responseJson['fixtures'].map<Game>((team) => Game.fromMap(team)).toList(),
    );

    return _championship;
  }
}
