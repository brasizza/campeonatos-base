import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Team {
  final String team;
  final String teamSlug;
  final String? teamId;
  final String? teamScId;
  final int? index;
  final int? matches;
  final int? points;
  final int? wins;
  final int? draws;
  final int? loses;
  Team({
    required this.team,
    required this.teamSlug,
    this.teamId,
    required this.teamScId,
    required this.index,
    required this.matches,
    required this.points,
    required this.wins,
    required this.draws,
    required this.loses,
  });

  Team copyWith({
    String? team,
    String? teamSlug,
    String? teamId,
    String? teamScId,
    int? index,
    int? matches,
    int? points,
    int? wins,
    int? draws,
    int? loses,
  }) {
    return Team(
      team: team ?? this.team,
      teamSlug: teamSlug ?? this.teamSlug,
      teamId: teamId ?? this.teamId,
      teamScId: teamScId ?? this.teamScId,
      index: index ?? this.index,
      matches: matches ?? this.matches,
      points: points ?? this.points,
      wins: wins ?? this.wins,
      draws: draws ?? this.draws,
      loses: loses ?? this.loses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'team': team,
      'teamSlug': teamSlug,
      'teamId': teamId,
      'teamScId': teamScId,
      'index': index,
      'matches': matches,
      'points': points,
      'wins': wins,
      'draws': draws,
      'loses': loses,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      team: map['team'] as String,
      teamSlug: map['teamSlug'] as String,
      teamId: map['teamId'] != null ? map['teamId'] as String : null,
      teamScId: map['teamScId'] != null ? map['teamScId'] as String : null,
      index: map['row'] != null ? map['row'] as int? : null,
      matches: map['p'] != null ? map['p'] as int? : null,
      points: map['pnt'] != null ? map['pnt'] as int? : null,
      wins: map['w'] != null ? map['w'] as int? : null,
      draws: map['d'] != null ? map['d'] as int? : null,
      loses: map['l'] != null ? map['l'] as int? : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Team(team: $team, teamSlug: $teamSlug, teamId: $teamId, teamScId: $teamScId, index: $index, matches: $matches, points: $points, wins: $wins, draws: $draws, loses: $loses)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Team && other.team == team && other.teamSlug == teamSlug && other.teamId == teamId && other.teamScId == teamScId && other.index == index && other.matches == matches && other.points == points && other.wins == wins && other.draws == draws && other.loses == loses;
  }

  @override
  int get hashCode {
    return team.hashCode ^ teamSlug.hashCode ^ teamId.hashCode ^ teamScId.hashCode ^ index.hashCode ^ matches.hashCode ^ points.hashCode ^ wins.hashCode ^ draws.hashCode ^ loses.hashCode;
  }
}
